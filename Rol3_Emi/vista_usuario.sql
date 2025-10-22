-- ==============================================
-- ROL 3 - VISTA ÚTIL
-- Tema: Usuario y Credencial de Acceso
-- ==============================================

USE usuariocredencial;

CREATE OR REPLACE VIEW vista_resumen_usuarios AS
SELECT 
    u.id,
    CONCAT(u.nombre, ' ', u.apellido) AS nombre_completo,
    u.username,
    u.email,
    u.activo,
    c.require_reset,
    c.ultimo_cambio,
    CASE 
        WHEN c.require_reset = TRUE THEN 'Debe cambiar contraseña'
        WHEN c.ultimo_cambio < DATE_SUB(CURDATE(), INTERVAL 6 MONTH) THEN 'Contraseña vieja'
        ELSE 'Credencial actualizada'
    END AS estado_credencial
FROM usuario u
JOIN credencial c ON u.id = c.id_usuario;

SELECT * FROM vista_resumen_usuarios LIMIT 10;
SELECT * FROM vista_resumen_usuarios WHERE estado_credencial != 'Credencial actualizada';
