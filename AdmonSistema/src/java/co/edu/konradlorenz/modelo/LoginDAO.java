package co.edu.konradlorenz.modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author camiloprieto
 */
public class LoginDAO {
    
    public LoginDAO() {
    }
    
    public Usuario Login_datos(String usuario, String clave) {
        Usuario datos = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            Conexion cn = new Conexion();
            conn = cn.crearConexion();
            stmt = conn.prepareStatement("SELECT * FROM usuarios WHERE usuario = ? AND clave = ?");
            stmt.setString(1, usuario);
            stmt.setString(2, clave);
            rs = stmt.executeQuery();
            
            if (rs.next()) {
                datos = new Usuario();
                datos.setUsuario(rs.getString("usuario"));
                datos.setClave(rs.getString("clave"));
            }
        } catch (SQLException e) {
            System.err.println("Error en Login_datos: " + e.getMessage());
            e.printStackTrace();
        } finally {
            // Cerrar recursos en orden inverso
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.err.println("Error al cerrar recursos: " + e.getMessage());
            }
        }
        return datos;
    }
}