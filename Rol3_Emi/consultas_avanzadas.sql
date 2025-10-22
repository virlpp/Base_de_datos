-- ==============================================
-- ROL 3 - CONSULTAS AVANZADAS
-- Base de Datos I
-- Tema: Usuario y Credencial de Acceso
-- ==============================================

USE usuariocredencial;

-- -------------------------------------------------
-- CONSULTA 1: Usuarios que requieren cambio de contraseña
-- -------------------------------------------------
SELECT 
    u.id, u.nombre, u.apellido, u.username, u.email, c.require_reset
FROM usuario u
JOIN credencial c ON u.id = c.id_usuario
WHERE c.require_reset = TRUE
ORDER BY u.nombre;

-- -------------------------------------------------
-- CONSULTA 2: Estado general de usuarios (activos/inactivos)
-- -------------------------------------------------
SELECT 
    CASE WHEN u.activo = TRUE THEN 'Activo' ELSE 'Inactivo' END AS estado,
    COUNT(*) AS cantidad,
    ROUND(COUNT(*) * 100 / (SELECT COUNT(*) FROM usuario), 2) AS porcentaje
FROM usuario u
GROUP BY estado
ORDER BY cantidad DESC;

-- -------------------------------------------------
-- CONSULTA 3: Usuarios con contraseñas antiguas (más de 6 meses)
-- -------------------------------------------------
SELECT 
    u.id, u.nombre, u.apellido, c.ultimo_cambio
FROM usuario u
JOIN credencial c ON u.id = c.id_usuario
WHERE c.ultimo_cambio < DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
ORDER BY c.ultimo_cambio;

-- -------------------------------------------------
-- CONSULTA 4: Usuarios antiguos que siguen activos
-- -------------------------------------------------
SELECT 
    u.id, u.nombre, u.apellido, u.fechaRegistro
FROM usuario u
WHERE u.fechaRegistro < DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
AND u.activo = TRUE
ORDER BY u.fechaRegistro;
