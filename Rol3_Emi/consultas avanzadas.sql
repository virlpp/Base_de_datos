
--  Consultas Avanzadas, Vistas y Análisis de Rendimiento
--  Gestión de Usuarios y Credenciales de Acceso
-- =============================================================

USE usuariocredencial;

-- =============================================================
-- CONSULTA 1: JOIN con condición de rango temporal
-- Objetivo: detectar credenciales modificadas recientemente.
-- =============================================================

DROP INDEX idx_credencial_ultimoCambio_idUsuario ON credencial;

SELECT u.id, u.nombre, u.apellido, c.ultimo_cambio
FROM usuario u
JOIN credencial c ON u.id = c.id_usuario
WHERE c.ultimo_cambio > DATE_SUB(CURDATE(), INTERVAL 30 DAY)
ORDER BY c.ultimo_cambio DESC;

-- Indice
CREATE INDEX idx_credencial_ultimoCambio_idUsuario ON credencial (ultimo_cambio, id_usuario);

EXPLAIN
SELECT u.id, u.nombre, u.apellido, c.ultimo_cambio
FROM usuario u
JOIN credencial c ON u.id = c.id_usuario
WHERE c.ultimo_cambio > DATE_SUB(CURDATE(), INTERVAL 30 DAY)
ORDER BY c.ultimo_cambio DESC;

-- =============================================================
-- CONSULTA 2: Agregación con GROUP BY y HAVING
-- Objetivo: contar usuarios con múltiples credenciales activas.
-- =============================================================

DROP INDEX idx_id_usuario ON credencial;

SELECT CASE WHEN u.activo = TRUE THEN 'Activo' ELSE 'Inactivo' END AS estado,
       COUNT(c.id) AS total_credenciales
FROM usuario u
JOIN credencial c ON u.id = c.id_usuario
GROUP BY estado
HAVING COUNT(c.id) > 3
ORDER BY total_credenciales DESC;

-- Indice
CREATE INDEX idx_id_usuario ON credencial (id_usuario);

EXPLAIN
SELECT CASE WHEN u.activo = TRUE THEN 'Activo' ELSE 'Inactivo' END AS estado,
       COUNT(c.id) AS total_credenciales
FROM usuario u
JOIN credencial c ON u.id = c.id_usuario
GROUP BY estado
HAVING COUNT(c.id) > 3
ORDER BY total_credenciales DESC;

-- =============================================================
-- CONSULTA 3: Subconsulta correlacionada
-- Objetivo: encontrar usuarios cuya contraseña no se modifica hace más de 6 meses.
-- =============================================================

DROP INDEX idx_fecha_registro ON usuario;

SELECT u.id, u.nombre, u.apellido, u.fechaRegistro
FROM usuario u
WHERE u.id IN (
    SELECT id_usuario
    FROM credencial
    WHERE ultimo_cambio < DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
)
ORDER BY u.fechaRegistro ASC;

-- Indice 
CREATE INDEX idx_fecha_registro ON usuario (fechaRegistro);

EXPLAIN
SELECT u.id, u.nombre, u.apellido, u.fechaRegistro
FROM usuario u
WHERE u.id IN (
    SELECT id_usuario
    FROM credencial
    WHERE ultimo_cambio < DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
)
ORDER BY u.fechaRegistro ASC;

