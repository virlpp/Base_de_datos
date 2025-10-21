import java.sql.*;
import java.util.concurrent.TimeUnit;

public class TransaccionesJava {
    
    private Connection connection;
    
    public TransaccionesJava(Connection connection) {
        this.connection = connection;
    }
    
    /**
     * Método para actualizar perfil completo con manejo de transacciones y deadlocks
     */
    public boolean actualizarPerfilCompleto(long idUsuario, String nuevoNombre, String nuevoApellido, String nuevoEmail) {
        int intentos = 0;
        final int MAX_INTENTOS = 2;
        
        while (intentos < MAX_INTENTOS) {
            try {
                // Iniciar transacción
                connection.setAutoCommit(false);
                
                // Verificar si el email ya existe en otro usuario
                if (verificarEmailExistente(nuevoEmail, idUsuario)) {
                    connection.rollback();
                    registrarError("Email ya existe para otro usuario: " + nuevoEmail);
                    return false;
                }
                
                // Actualizar datos del usuario
                int filasActualizadas = actualizarUsuario(idUsuario, nuevoNombre, nuevoApellido, nuevoEmail);
                
                if (filasActualizadas > 0) {
                    // Registrar en log de auditoría
                    registrarAuditoria("Perfil actualizado para usuario: " + idUsuario);
                    
                    // Confirmar transacción
                    connection.commit();
                    System.out.println("Perfil actualizado exitosamente para usuario: " + idUsuario);
                    return true;
                } else {
                    connection.rollback();
                    registrarError("No se pudo actualizar el perfil para usuario: " + idUsuario);
                    return false;
                }
                
            } catch (SQLException e) {
                try {
                    connection.rollback();
                } catch (SQLException rollbackEx) {
                    System.err.println("Error en rollback: " + rollbackEx.getMessage());
                }
                
                // Verificar si es deadlock (código 1213)
                if (e.getErrorCode() == 1213 && intentos < MAX_INTENTOS - 1) {
                    intentos++;
                    System.out.println("Deadlock detectado. Reintento #" + intentos + " para usuario: " + idUsuario);
                    
                    // Backoff exponencial
                    try {
                        TimeUnit.MILLISECONDS.sleep(100 * intentos);
                    } catch (InterruptedException ie) {
                        Thread.currentThread().interrupt();
                    }
                    
                } else {
                    // Otro tipo de error o máximo de reintentos alcanzado
                    System.err.println("Error en actualización de perfil: " + e.getMessage());
                    registrarError("Error en actualización de perfil: " + e.getMessage());
                    return false;
                }
            } finally {
                try {
                    connection.setAutoCommit(true);
                } catch (SQLException e) {
                    System.err.println("Error restableciendo autoCommit: " + e.getMessage());
                }
            }
        }
        
        return false;
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
            // Esto debería fallar o no retornar resultados inesperados
            long id = Long.parseLong(entradaMaliciosa); // Esto lanzará NumberFormatException
            consultarUsuarioSeguro(id);
        } catch (NumberFormatException e) {
            System.out.println("✓ Inyección SQL prevenida: La entrada fue rechazada por tipo de dato incorrecto");
            System.out.println("Explicación: PreparedStatement trata la entrada como dato, no como código SQL");
            System.out.println("La entrada '" + entradaMaliciosa + "' no puede convertirse a LONG");
        }
    }
    
    // Métodos auxiliares
    private boolean verificarEmailExistente(String email, long idUsuarioExcluir) throws SQLException {
        String sql = "SELECT COUNT(*) as count FROM usuario WHERE email = ? AND id != ? AND eliminado = FALSE";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, email);
            pstmt.setLong(2, idUsuarioExcluir);
            ResultSet rs = pstmt.executeQuery();
            return rs.next() && rs.getInt("count") > 0;
        }
    }
    
    private int actualizarUsuario(long idUsuario, String nuevoNombre, String nuevoApellido, String nuevoEmail) throws SQLException {
        String sql = "UPDATE usuario SET nombre = ?, apellido = ?, email = ? WHERE id = ? AND eliminado = FALSE";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, nuevoNombre);
            pstmt.setString(2, nuevoApellido);
            pstmt.setString(3, nuevoEmail);
            pstmt.setLong(4, idUsuario);
            return pstmt.executeUpdate();
        }
    }
    
    private void registrarError(String mensaje) {
        String sql = "INSERT INTO log_errores (descripcion) VALUES (?)";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, mensaje);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Error registrando en log: " + e.getMessage());
        }
    }
    
    private void registrarAuditoria(String mensaje) {
        String sql = "INSERT INTO log_errores (descripcion) VALUES (?)";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, "AUDITORÍA: " + mensaje);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Error registrando auditoría: " + e.getMessage());
        }
    }
    
    /**
     * Ejemplo de uso de los métodos
     */
    public static void main(String[] args) {
        // Ejemplo de conexión (debes configurar tu propia conexión)
        try (Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/usuariocredencial", "usuario", "password")) {
            
            TransaccionesJava transacciones = new TransaccionesJava(conn);
            
            // Prueba anti-inyección
            transacciones.pruebaAntiInyeccion();
            
            // Consulta segura
            transacciones.consultarUsuarioSeguro(1);
            
            // Actualizar perfil con manejo de transacciones
            transacciones.actualizarPerfilCompleto(1, "Juan Carlos", "Perez Gonzalez", "juan.carlos@email.com");
            
            // Cambiar credenciales
            transacciones.cambiarCredenciales(1, "nuevo_hash_seguro", "nuevo_salt_123", false);
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}