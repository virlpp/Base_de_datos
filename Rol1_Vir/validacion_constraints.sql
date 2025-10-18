-- Inserciones inválidas
-- Prueba 1 , es inválido porque el username debe ser único y ya se agregó anteriormente una Olivia Garcia con username "oligarcia"
INSERT INTO usuario (nombre, apellido, username, email)
VALUES ("Olivia","García","oligarcia","oliviag@gmail.com");

INSERT INTO credencial (contraseña, salt, id_usuario)
VALUES ("hash_lkj5821de584ft","salt_5546844v", 3);

-- Prueba 2, es inválido porque el id_usuario debe ser único y el '2' fue agregado anteriormente y asignado a "rsuarez"
INSERT INTO usuario (nombre, apellido, username, email)
VALUES ("Jazmín","Machado","jazmachado","j.machado@gmail.com");

INSERT INTO credencial (contraseña, salt, id_usuario)
VALUES ("hash_j23v541fe5v4y","salt_54rf6rwc1v", 2);
