-- Inserciones válidas
-- Prueba 1 , es inválido porque el username debe ser único y ya se agregó anteriormente una Olivia Garcia con username "oligarcia"
INSERT INTO usuario (nombre, apellido, username, email)
VALUES ("Olivia","García","oligarcia","oligarcia@gmail.com");

INSERT INTO credencial (contraseña, salt, id_usuario)
VALUES ("hash_lkj5821de584ft","salt_5546844v", 1);

-- Prueba 2, es inválido porque el id_usuario debe ser único y el '2' fue agregado anteriormente y asignado a "rsuarez"
INSERT INTO usuario (nombre, apellido, username, email)
VALUES ("Ricardo","Suarez","rsuarez","ricsuarez@gmail.com");

INSERT INTO credencial (contraseña, salt, id_usuario)
VALUES ("hash_jv25e463v54ety","salt_52vew532rv", 2);

-- Inserciones inválidas. Entradas duplicadas.
-- Prueba 1 , es inválido porque el username debe ser único y ya se agregó anteriormente una Olivia Garcia con username "oligarcia"
INSERT INTO usuario (nombre, apellido, username, email)
VALUES ("Olivia","García","oligarcia","oliviag@gmail.com");

INSERT INTO credencial (contraseña, salt, id_usuario)
VALUES ("hash_165f4vc6df","salt_156336c", 3);

-- Prueba 2, es inválido porque el id_usuario debe ser único y el '2' fue agregado anteriormente y asignado a "rsuarez"
INSERT INTO usuario (nombre, apellido, username, email)
VALUES ("Jazmín","Machado","jazmachado","j.machado@gmail.com");

INSERT INTO credencial (contraseña, salt, id_usuario)
VALUES ("hash_j23v541fe5v4y","salt_54rf6rwc1v", 2);
