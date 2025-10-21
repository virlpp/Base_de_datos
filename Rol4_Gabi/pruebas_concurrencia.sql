-- =============================================
-- PRUEBAS DE CONCURRENCIA Y TRANSACCIONES
-- =============================================

USE usuariocredencial;

-- 1. CONFIGURACIÓN DE NIVELES DE AISLAMIENTO
-- =============================================

-- Ver nivel de aislamiento actual
SELECT @@transaction_isolation;

-- Cambiar a READ COMMITTED
SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- Cambiar a REPEATABLE READ  
SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- 3. TABLA PARA LOGS DE ERRORES Y AUDITORÍA (se necesita crear antes de usarla)
-- =============================================

CREATE TABLE IF NOT EXISTS log_errores (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    descripcion TEXT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. PROCEDIMIENTOS CON TRANSACCIONES Y DEADLOCKS
-- =============================================

DELIMITER //

-- Procedimiento para actualizar perfil con manejo de deadlock
DROP PROCEDURE IF EXISTS sp_actualizar_perfil_completo;
CREATE PROCEDURE sp_actualizar_perfil_completo(
    IN p_id_usuario BIGINT,
    IN p_nuevo_nombre VARCHAR(50),
    IN p_nuevo_apellido VARCHAR(50),
    IN p_nuevo_email VARCHAR(120)
)
BEGIN
    DECLARE v_intentos INT DEFAULT 0;
    DECLARE v_exito BOOLEAN DEFAULT FALSE;
    DECLARE v_email_existe INT DEFAULT 0;

    DECLARE EXIT HANDLER FOR 1213 -- Deadlock
    BEGIN
        SET v_intentos = v_intentos + 1;
        IF v_intentos <= 2 THEN
            DO SLEEP(0.1); -- espera definida para antes de reintentar
            CALL sp_actualizar_perfil_completo(p_id_usuario, p_nuevo_nombre, p_nuevo_apellido, p_nuevo_email);
        ELSE
            INSERT INTO log_errores (descripcion, fecha) 
            VALUES ('Deadlock en actualización de perfil después de 2 reintentos', NOW());
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: No se pudo actualizar el perfil después de múltiples intentos';
        END IF;
    END;

    START TRANSACTION;

    -- Verificar si el nuevo email ya existe en otro usuario
    SELECT COUNT(*) INTO v_email_existe 
    FROM usuario 
    WHERE email = p_nuevo_email 
      AND id != p_id_usuario 
      AND eliminado = FALSE;

    IF v_email_existe = 0 THEN
        UPDATE usuario 
        SET nombre = p_nuevo_nombre,
            apellido = p_nuevo_apellido,
            email = p_nuevo_email
        WHERE id = p_id_usuario 
          AND eliminado = FALSE;

        IF ROW_COUNT() > 0 THEN
            SET v_exito = TRUE;
            INSERT INTO log_errores (descripcion, fecha)
            VALUES (CONCAT('Perfil actualizado para usuario: ', p_id_usuario), NOW());
        ELSE
            INSERT INTO log_errores (descripcion, fecha)
            VALUES ('No se pudo actualizar el perfil del usuario', NOW());
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: No se pudo actualizar el perfil';
        END IF;
    ELSE
        INSERT INTO log_errores (descripcion, fecha)
        VALUES ('Email ya existe para otro usuario', NOW());
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: El email ya está en uso por otro usuario';
    END IF;

    IF v_exito THEN
        COMMIT;
        SELECT 'Perfil actualizado exitosamente' AS resultado;
    ELSE
        ROLLBACK;
    END IF;
END //

-- Procedimiento para cambiar credenciales con manejo de deadlock
DROP PROCEDURE IF EXISTS sp_cambiar_credenciales;
CREATE PROCEDURE sp_cambiar_credenciales(
    IN p_id_usuario BIGINT,
    IN p_nueva_contrasena VARCHAR(255),
    IN p_nuevo_salt VARCHAR(64),
    IN p_requiere_reset BOOLEAN
)
BEGIN
    DECLARE v_intentos INT DEFAULT 0;
    DECLARE v_usuario_activo BOOLEAN DEFAULT FALSE;

    DECLARE EXIT HANDLER FOR 1213
    BEGIN
        SET v_intentos = v_intentos + 1;
        IF v_intentos <= 2 THEN
            DO SLEEP(0.1);
            CALL sp_cambiar_credenciales(p_id_usuario, p_nueva_contrasena, p_nuevo_salt, p_requiere_reset);
        ELSE
            INSERT INTO log_errores (descripcion, fecha) 
            VALUES ('Deadlock en cambio de credenciales', NOW());
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error en cambio de credenciales después de múltiples intentos';
        END IF;
    END;

    START TRANSACTION;

    SELECT activo INTO v_usuario_activo 
    FROM usuario 
    WHERE id = p_id_usuario 
      AND eliminado = FALSE;

    IF v_usuario_activo THEN
        UPDATE credencial 
        SET `contraseña` = p_nueva_contrasena,
            salt = p_nuevo_salt,
            ultimo_cambio = NOW(),
            require_reset = p_requiere_reset
        WHERE id_usuario = p_id_usuario 
          AND eliminado = FALSE;

        INSERT INTO log_errores (descripcion, fecha)
        VALUES (CONCAT('Credenciales actualizadas para usuario: ', p_id_usuario), NOW());

        COMMIT;
        SELECT 'Credenciales actualizadas exitosamente' AS resultado;
    ELSE
        ROLLBACK;
        INSERT INTO log_errores (descripcion, fecha)
        VALUES ('Usuario inactivo o no encontrado para cambio de credenciales', NOW());
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Usuario inactivo o no encontrado';
    END IF;
END //

DELIMITER ;

-- TO DO: Se encuentra comentado para volver a probar y corregir errores
-- 4. SIMULACIÓN DE DEADLOCK (ejecutar en 2 sesiones distintas)
-- =============================================

-- SESIÓN 1:
-- START TRANSACTION;
-- UPDATE usuario SET nombre = 'Sesion1' WHERE id = 1;
-- (Esperar 5-10 segundos)
-- UPDATE credencial SET ultimo_cambio = NOW() WHERE id_usuario = 2;
-- COMMIT;

-- SESIÓN 2:
-- START TRANSACTION;
-- UPDATE credencial SET ultimo_cambio = NOW() WHERE id_usuario = 2;
-- (Esperar 5-10 segundos)
-- UPDATE usuario SET nombre = 'Sesion2' WHERE id = 1;
-- COMMIT;

-- 5. COMPARACIÓN DE NIVELES DE AISLAMIENTO
-- =============================================

-- Prueba con READ COMMITTED
-- SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- SESIÓN 1:
-- START TRANSACTION;
-- SELECT * FROM usuario WHERE id = 1;

-- SESIÓN 2:
-- UPDATE usuario SET apellido = 'ApellidoRC' WHERE id = 1;
-- COMMIT;

-- SESIÓN 1:
-- SELECT * FROM usuario WHERE id = 1;
-- COMMIT;

-- Prueba con REPEATABLE READ
-- SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- SESIÓN 1:
-- START TRANSACTION;
-- SELECT * FROM usuario WHERE id = 1;

-- SESIÓN 2:
-- UPDATE usuario SET apellido = 'ApellidoRR' WHERE id = 1;
-- COMMIT;

-- SESIÓN 1:
-- SELECT * FROM usuario WHERE id = 1;
-- COMMIT;

-- 6. PRUEBAS DE LOS PROCEDIMIENTOS
-- =============================================

CALL sp_actualizar_perfil_completo(1, 'Juan Carlos', 'Perez Gonzalez', 'juan.carlos@email.com');
CALL sp_cambiar_credenciales(1, 'nuevo_hash_seguro', 'nuevo_salt_123', FALSE);

-- Verificar logs
SELECT * FROM log_errores ORDER BY fecha DESC;

-- 7. CONSULTAS PARA VERIFICAR RESULTADOS
-- =============================================

SELECT id, nombre, apellido, username, email, activo FROM usuario WHERE eliminado = FALSE;

SELECT c.id, u.username, c.ultimo_cambio, c.require_reset 
FROM credencial c 
JOIN usuario u ON c.id_usuario = u.id 
WHERE c.eliminado = FALSE;