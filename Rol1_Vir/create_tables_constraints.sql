create database usuariocredencial;

use usuariocredencial;

-- creación de tabla usuario
create table usuario(
	
	id BIGINT PRIMARY KEY AUTO_INCREMENT, -- BIGINT para que coincida con LONG de Java
	eliminado BOOLEAN DEFAULT FALSE, -- por defecto no está eliminado
    
    -- información personal de usuario
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
	username VARCHAR(30) NOT NULL UNIQUE,
	email VARCHAR(120) NOT NULL UNIQUE,
    
    -- se elimino fecha de_nacimiento ya que el CHECH (fecha_nacimiento < CURRENT TIME) generaba un error
    
	activo BOOLEAN NOT NULL DEFAULT TRUE, -- por defecto está activo
    -- la fecha y hora se establece automáticamente al crear el usuario
	fechaRegistro DATETIME DEFAULT CURRENT_TIMESTAMP 
	-- credencial CredencialAcceso referencia 1a1 a B 
);

-- creación de tabla credencial
create table credencial(

	id BIGINT PRIMARY KEY AUTO_INCREMENT,
	eliminado BOOLEAN DEFAULT FALSE,
	contraseña VARCHAR(255) NOT NULL,
    
    -- El salt es un dato público (se guarda junto al hash) que hace que cada contraseña encriptada sea única, 
    -- incluso si las contraseñas originales eran iguales. Es una medida de seguridad fundamental. 🔐
    salt VARCHAR(64),
    
    ultimo_cambio DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- se actualiza automáticamente al modificarse
    require_reset BOOLEAN NOT NULL DEFAULT FALSE,
    
    -- clave foránea
    id_usuario BIGINT NOT NULL UNIQUE, -- debe ser del mismo tipo que id en tabla usuario (BIGINT)
    CONSTRAINT fk_credencial_usuario -- para darle nombre único y descriptivo a la regla que se crea
		FOREIGN KEY (id_usuario) REFERENCES usuario(id)
);
        FOREIGN KEY (id_usuario) 
        REFERENCES usuario(id)
);
