
-- ********* TPI_Programación 2 Etapa de verificaciones **********
-- Tomar captura de pantalla de los resultados o crear una tabla en word y pasar esos datos de forma prolija

---------------------------------------

-- 1.1 Conteo total de usuarios (Debe ser el número que esperas, ej. 300000)
SELECT 'Total Usuarios' AS Tabla, COUNT(*) AS TotalRegistros FROM usuario
UNION ALL
-- 1.2 Conteo total de credenciales (Debe coincidir con el total de usuarios)
SELECT 'Total Credenciales', COUNT(*) FROM credencial;

-- 2. Conteo de Credenciales sin Usuario asociado (Debe dar CERO)
SELECT 
    COUNT(c.id) AS CredencialesHuerfanas
FROM 
    credencial c
LEFT JOIN 
    usuario u ON c.ID_Usuario = u.id
WHERE 
    u.id IS NULL;
    
-- 3. Verificación de ID_Usuario duplicados en la tabla Credenciales (Debe dar CERO)
SELECT 
    ID_Usuario,
    COUNT(ID_Usuario) AS TotalCredenciales
FROM 
    credencial
GROUP BY 
    ID_Usuario
HAVING 
    COUNT(ID_Usuario) > 1; -- Busca IDs que aparecen más de una vez
    
-- 4. Conteo de Usuarios fuera del rango de 5 años (Debe dar CERO o un número muy bajo si la lógica RAND es muy amplia)
SELECT 
    COUNT(*) AS RegistrosAntiguos
FROM 
    usuario
WHERE 
    fechaRegistro < DATE_SUB(CURDATE(), INTERVAL 5 YEAR);
    
-- 5. Distribución del flag 'activo' (Debe acercarse al porcentaje programado, ej. 95%)
SELECT
    activo,
    COUNT(*) AS Total,
    (COUNT(*) / (SELECT COUNT(*) FROM usuario)) * 100 AS Porcentaje
FROM
    usuario
GROUP BY
    activo;

