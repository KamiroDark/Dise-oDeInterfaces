package co.edu.konradlorenz.modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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

            // Consulta que incluye el perfil del usuario
            stmt = conn.prepareStatement(
                    "SELECT u.id, u.identificacion, u.nombre, u.apellido, u.email, "
                    + "u.telefono, u.usuario, u.clave, u.id_perfil, p.perfil "
                    + "FROM usuario u "
                    + "INNER JOIN perfiles p ON u.id_perfil = p.idperfiles "
                    + "WHERE u.usuario = ? AND u.clave = ?"
            );

            stmt.setString(1, usuario);
            stmt.setString(2, clave);
            rs = stmt.executeQuery();

            if (rs.next()) {
                datos = new Usuario();
                datos.setId(rs.getInt("id"));
                datos.setIdentificacion(rs.getInt("identificacion"));
                datos.setNombre(rs.getString("nombre"));
                datos.setApellido(rs.getString("apellido"));
                datos.setEmail(rs.getString("email"));
                datos.setTelefono(rs.getString("telefono"));
                datos.setUsuario(rs.getString("usuario"));
                datos.setClave(rs.getString("clave"));
                datos.setPerfil(rs.getInt("id_perfil"));
                // Guardamos el nombre del perfil también si agregas un atributo en Usuario
            }
        } catch (SQLException e) {
            System.err.println("Error en Login_datos: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                System.err.println("Error al cerrar recursos: " + e.getMessage());
            }
        }
        return datos;
    }
}
