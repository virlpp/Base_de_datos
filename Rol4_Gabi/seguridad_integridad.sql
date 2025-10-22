-- =============================================
-- SEGURIDAD E INTEGRIDAD - USUARIOS Y VISTAS
-- =============================================

USE usuariocredencial;

-- 1. VISTAS DE SEGURIDAD
-- =============================================

CREATE OR REPLACE VIEW vista_usuarios_publica AS
SELECT 
    id,
    nombre,
    apellido,
    username,
    CONCAT(SUBSTRING(email, 1, 3), '***', SUBSTRING(email, LOCATE('@', email))) AS email_protegido,
    activo,
    fechaRegistro
FROM usuario
WHERE eliminado = FALSE AND activo = TRUE;

CREATE OR REPLACE VIEW vista_credenciales_segura AS
SELECT 
    c.id,
    u.nombre,
    u.apellido,
    u.username,
    c.ultimo_cambio,
    c.require_reset
FROM credencial c
JOIN usuario u ON c.id_usuario = u.id
WHERE c.eliminado = FALSE AND u.eliminado = FALSE;

-- 2. PROCEDIMIENTOS ALMACENADOS
-- =============================================

DELIMITER //
-- Procedimiento 1: consultar usuario seguro
CREATE PROCEDURE sp_consultar_usuario_seguro(IN p_id_usuario BIGINT)
BEGIN
    SELECT 
        id,
        nombre,
        apellido,
        username,
        CONCAT(SUBSTRING(email, 1, 3), '***', SUBSTRING(email, LOCATE('@', email))) AS email_protegido,
        activo,
        fechaRegistro
    FROM usuario 
    WHERE id = p_id_usuario 
      AND eliminado = FALSE 
      AND activo = TRUE;
END //

-- Procedimiento 2: verificar login seguro (simulado)
CREATE PROCEDURE sp_verificar_login_seguro(
    IN p_username VARCHAR(30),
    IN p_contrasena VARCHAR(255) -- parámetro con nombre ASCII
)
BEGIN
    DECLARE v_usuario_id BIGINT DEFAULT NULL;
    DECLARE v_contrasena_hash VARCHAR(255);
    DECLARE v_salt VARCHAR(64);
    DECLARE v_activo BOOLEAN;

    -- Buscar usuario y credencial
    SELECT u.id, c.`contraseña`, c.salt, u.activo
    INTO v_usuario_id, v_contrasena_hash, v_salt, v_activo
    FROM usuario u
    JOIN credencial c ON u.id = c.id_usuario
    WHERE u.username = p_username
      AND u.eliminado = FALSE;

    IF v_usuario_id IS NOT NULL AND v_activo = TRUE THEN
        -- aquí iría la verificación real: p_contrasena + v_salt -> hash y comparar con v_contrasena_hash
        IF p_contrasena = 'contraseña_correcta' THEN
            SELECT 'Login exitoso' AS resultado, v_usuario_id AS id_usuario;
        ELSE
            SELECT 'Credenciales incorrectas' AS resultado, NULL AS id_usuario;
        END IF;
    ELSE
        SELECT 'Usuario no encontrado o inactivo' AS resultado, NULL AS id_usuario;
    END IF;
END //

DELIMITER ;

-- 3. CREACIÓN DE USUARIO CON PRIVILEGIOS MÍNIMOS
-- =============================================

CREATE USER IF NOT EXISTS 'usuario_lectura'@'localhost' IDENTIFIED BY 'prueba_minimos123';

GRANT SELECT ON usuariocredencial.vista_usuarios_publica TO 'usuario_lectura'@'localhost';
GRANT SELECT ON usuariocredencial.vista_credenciales_segura TO 'usuario_lectura'@'localhost';
GRANT EXECUTE ON PROCEDURE usuariocredencial.sp_consultar_usuario_seguro TO 'usuario_lectura'@'localhost';

SHOW GRANTS FOR 'usuario_lectura'@'localhost';

-- 4. PRUEBAS DE INTEGRIDAD (datos de ejemplo)
-- =============================================

INSERT INTO usuario (nombre, apellido, username, email, activo) VALUES 
('Juan', 'Perez', 'juanperez', 'juan@email.com', TRUE),
('Maria', 'Gomez', 'mariag', 'maria@email.com', TRUE),
('Carlos', 'Lopez', 'carlosl', 'carlos@email.com', TRUE);

INSERT INTO credencial (`contraseña`, salt, id_usuario) VALUES 
('hash_contraseña_1', 'salt1', 1),
('hash_contraseña_2', 'salt2', 2),
('hash_contraseña_3', 'salt3', 3);

INSERT INTO usuario (nombre, apellido, username, email, activo) 
VALUES ('Pedro', 'Gomez', 'juanperez', 'pedro@email.com', TRUE);

INSERT INTO credencial (`contraseña`, salt, id_usuario) 
VALUES ('hash_falla', 'salt_falla', 999);

-- 5. PRUEBAS Y LLAMADAS
-- =============================================

CALL sp_consultar_usuario_seguro('A OR 1=1');
CALL sp_verificar_login_seguro('juanperez', 'contraseña_correcta');

-- 6. VERIFICACIÓN DE VISTAS
-- =============================================

SELECT * FROM vista_usuarios_publica;
SELECT * FROM vista_credenciales_segura;