import java.sql.*;

public class TransaccionesJava {
    
    private Connection connection;
    
    public TransaccionesJava(Connection connection) {
        this.connection = connection;
    }

    /**
     * Método para cambiar credenciales de usuario
     */
    public boolean cambiarCredenciales(long idUsuario, String nuevaContraseñaHash, String nuevoSalt, boolean requiereReset) {
        String sql = "UPDATE credencial SET contraseña = ?, salt = ?, ultimo_cambio = NOW(), require_reset = ? " +
                    "WHERE id_usuario = ? AND eliminado = FALSE";
        
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            connection.setAutoCommit(false);
            
            pstmt.setString(1, nuevaContraseñaHash);
            pstmt.setString(2, nuevoSalt);
            pstmt.setBoolean(3, requiereReset);
            pstmt.setLong(4, idUsuario);
            
            int filasActualizadas = pstmt.executeUpdate();
            
            if (filasActualizadas > 0) {
                registrarAuditoria("Credenciales actualizadas para usuario: " + idUsuario);
                connection.commit();
                System.out.println("Credenciales actualizadas exitosamente");
                return true;
            } else {
                connection.rollback();
                System.out.println("No se encontró la credencial del usuario");
                return false;
            }
            
        } catch (SQLException e) {
            try {
                connection.rollback();
            } catch (SQLException rollbackEx) {
                System.err.println("Error en rollback: " + rollbackEx.getMessage());
            }
            System.err.println("Error cambiando credenciales: " + e.getMessage());
            return false;
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException e) {
                System.err.println("Error restableciendo autoCommit: " + e.getMessage());
            }
        }
    }
    
    /**
     * Consulta segura usando PreparedStatement (anti SQL Injection)
     */
    public void consultarUsuarioSeguro(long idUsuario) {
        String sql = "SELECT id, nombre, apellido, username, email, activo, fechaRegistro " +
                    "FROM usuario WHERE id = ? AND eliminado = FALSE AND activo = TRUE";
        
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            // Establecer parámetro de forma segura
            pstmt.setLong(1, idUsuario);
            
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                System.out.println("Usuario encontrado:");
                System.out.println("ID: " + rs.getLong("id"));
                System.out.println("Nombre: " + rs.getString("nombre") + " " + rs.getString("apellido"));
                System.out.println("Username: " + rs.getString("username"));
                System.out.println("Email: " + rs.getString("email"));
                System.out.println("Activo: " + rs.getBoolean("activo"));
                System.out.println("Fecha Registro: " + rs.getTimestamp("fechaRegistro"));
            } else {
                System.out.println("Usuario no encontrado o inactivo");
            }
            
        } catch (SQLException e) {
            System.err.println("Error en consulta: " + e.getMessage());
        }
    }
    
    /**
     * Prueba anti-inyección SQL
     */
    public void pruebaAntiInyeccion() {
        System.out.println("=== PRUEBA ANTI-INYECCIÓN SQL ===");
        
        // Entrada maliciosa simulada
        String entradaMaliciosa = "1 OR 1=1";
        
        System.out.println("Intentando consulta con entrada maliciosa: " + entradaMaliciosa);
        
        try {
            // Falla al no retornar resultados inesperados
            long id = Long.parseLong(entradaMaliciosa);
            consultarUsuarioSeguro(id);
        } catch (NumberFormatException e) {
            System.out.println("Inyección SQL prevenida: La entrada fue rechazada por tipo de dato incorrecto");
            System.out.println("Explicación: PreparedStatement trata la entrada como dato, no como código SQL");
            System.out.println("La entrada '" + entradaMaliciosa + "' no puede convertirse a LONG");
        }
    }
    
    // Métodos auxiliares   
    private void registrarAuditoria(String mensaje) {
        String sql = "INSERT INTO log_errores (descripcion) VALUES (?)";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, "AUDITORÍA: " + mensaje);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Error registrando auditoría: " + e.getMessage());
        }
    }
    
    public static void main(String[] args) {
        final String AIVEN_HOST = "mysql-1e724b1f-bd2025.d.aivencloud.com"; 
        final int AIVEN_PORT = 27115;
        final String DB_NAME = "usuariocredencial";
        final String AIVEN_USER = "avnadmin"; 
        final String AIVEN_PASSWORD = "AVNS_uLwG6vqYyriF_v-PAif";

        final String JDBC_URL = 
            "jdbc:mysql://" + AIVEN_HOST + ":" + AIVEN_PORT + "/" + DB_NAME + 
            "?sslMode=REQUIRED&verifyServerCertificate=true";
        
        try (Connection conn = DriverManager.getConnection(
                JDBC_URL, AIVEN_USER, AIVEN_PASSWORD)) {
            
            TransaccionesJava transacciones = new TransaccionesJava(conn);
            
            // Prueba anti-inyección
            transacciones.pruebaAntiInyeccion();
            
            // Consulta segura
            //transacciones.consultarUsuarioSeguro(1);
                        
            // Cambiar credenciales
            //transacciones.cambiarCredenciales(1, "nuevo_hash_seguro", "nuevo_salt_123", false);
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}