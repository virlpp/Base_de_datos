use usuariocredencial;
SELECT COUNT(*) FROM usuario;
SELECT * FROM usuario ORDER BY id DESC LIMIT 15; -- Revisa los últimos 15
SELECT * FROM credencial ORDER BY id_usuario DESC LIMIT 15;
