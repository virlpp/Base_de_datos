create database usuariocredencial;
use usuariocredencial;

DROP TABLE IF EXISTS Credencial;
DROP TABLE IF EXISTS Usuario;

-- creación de tabla usuario
create table usuario(
	
	id BIGINT PRIMARY KEY AUTO_INCREMENT, 
	eliminado BOOLEAN DEFAULT FALSE, 
    
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
	username VARCHAR(30) NOT NULL UNIQUE,
	email VARCHAR(120) NOT NULL UNIQUE,
    
	activo BOOLEAN NOT NULL DEFAULT TRUE, 
	fechaRegistro DATETIME DEFAULT CURRENT_TIMESTAMP 
);

-- creación de tabla credencial
CREATE TABLE credencial (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    eliminado TINYINT DEFAULT 0,
    contraseña VARCHAR(255) NOT NULL,
    salt VARCHAR(64) NOT NULL,
    ultimo_cambio DATETIME,
    require_reset TINYINT DEFAULT 0,
    id_usuario BIGINT NOT NULL,
    
    -- La clave para la relación 1 a 1: la clave foránea también es única.
    CONSTRAINT uc_credencial_id_usuario UNIQUE (id_usuario),
    
    -- La clave foránea que establece la relación
    CONSTRAINT fk_credencial_usuario 
        FOREIGN KEY (id_usuario) 
        REFERENCES usuario(id)
);
