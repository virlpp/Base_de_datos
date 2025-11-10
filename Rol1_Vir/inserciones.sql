-------------------- UNIQUE VÁLIDO ----------------------------------

-- Prueba 1 , válida, el username debe ser único y no hay ninguno con "oligarcia".
INSERT INTO usuario (nombre, apellido, username, email)  
VALUES ("Olivia","García","oligarcia","oligarcia@gmail.com"); -- Se cumple UNIQUE, NOT NULL y CHECK

INSERT INTO credencial (contraseña, salt, id_usuario)
VALUES ("hash_lkj5821de584ft","salt_5546844v", 1); -- Se cumple UNIQUE y NOT NULL

-- Prueba 2, es válido porque el id_usuario debe ser único y el '2' no fue asignado anteriormente.
INSERT INTO usuario (nombre, apellido, username, email)
VALUES ("Ricardo","Suarez","rsuarez","ricsuarez@gmail.com"); -- Se cumple UNIQUE, NOT NULL y CHECK

INSERT INTO credencial (contraseña, salt, id_usuario)
VALUES ("hash_jv25e463v54ety","salt_52vew532rv", 2); -- Se cumple UNIQUE y NOT NULL

--------------------- UNIQUE INVÁLIDO -------------------

-- Prueba 1 , es inválido porque el username debe ser único y ya se agregó anteriormente una Olivia Garcia con username "oligarcia"
INSERT INTO usuario (nombre, apellido, username, email)
VALUES ("Olivia","García","oligarcia","oliviag@gmail.com"); -- Se cumple NOT NULL y CHECK, no se cumple UNIQUE

INSERT INTO credencial (contraseña, salt, id_usuario)
VALUES ("hash_165f4vc6df","salt_156336c", 3); -- Se cumple UNIQUE y NOT NULL

-- Prueba 2, es inválido porque el id_usuario debe ser único y el '2' fue agregado anteriormente y asignado a "rsuarez"
INSERT INTO usuario (nombre, apellido, username, email)
VALUES ("Jazmín","Machado","jazmachado","j.machado@gmail.com"); -- Se cumple NOT NULL y CHECK, no se cumple UNIQUE

INSERT INTO credencial (contraseña, salt, id_usuario)
VALUES ("hash_j23v541fe5v4y","salt_54rf6rwc1v", 2); -- No se cumple UNIQUE.


------------------- CHECK Y NOT NULL VÁLIDOS-----------------------------------

-- Válida 1 (Usa acento y 'ñ')
INSERT INTO usuario (nombre, apellido, username, email) 
VALUES ('Ángel', 'Muñoz', 'amunoz', 'angel.munoz@correo.com');

-- Credencial para Ángel Muñoz (id 3)
INSERT INTO credencial (contraseña, salt, id_usuario) 
VALUES ('hash_muy_seguro_123', 'salt_aleatorio_xyz', 3);

-- Válida 2 (Usa nombre compuesto con espacio)
INSERT INTO usuario (nombre, apellido, username, email) 
VALUES ('María José', 'Paz', 'majopaz', 'maria.jose@correo.com');

-- Credencial para María José Paz (id 4)
INSERT INTO credencial (contraseña, salt, id_usuario) 
VALUES ('otro_hash_456', 'salt_diferente_abc', 4);

---------------------- CHECK INVALIDO ---------------------------

-- Inválida 1: Falla el CHECK de 'nombre' (contiene números)
INSERT INTO usuario (nombre, apellido, username, email) 
VALUES ('Juan1990', 'García', 'juang', 'juan.garcia@correo.com');
-- Error esperado: CHECK constraint 'chk_nombre_solo_letras' is violated.

-- Inválida 2: Falla el CHECK de 'apellido' (contiene un guion)
INSERT INTO usuario (nombre, apellido, username, email) 
VALUES ('Ana', 'Pérez-Gómez', 'anapg', 'ana.perez@correo.com');
-- Error esperado: CHECK constraint 'chk_apellido_solo_letras' is violated.

---------------------- NOT NULL INVALIDO ---------------------------

-- Inválida 1: Falla el NOT NULL de 'username'
INSERT INTO usuario (nombre, apellido, username, email) 
VALUES ('Pedro', 'López', NULL, 'pedro.lopez@correo.com');
-- Error esperado: Column 'username' cannot be null.

-- Inválida 2: Falla el NOT NULL de 'email'
INSERT INTO usuario (nombre, apellido, username, email) 
VALUES ('Laura', 'Martínez', 'lauram', NULL);
-- Error esperado: Column 'email' cannot be null.
