package co.edu.konradlorenz.modelo;

import co.edu.konradlorenz.interfaces.CRUD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAO implements CRUD {

    Conexion cn = new Conexion();

    // ---------------------------------------------------------
    // MÉTODO: AGREGAR USUARIO
    // ---------------------------------------------------------
    @Override
    public int agregarUsuario(Usuario u) {
        int estatus = 0;

        String q = "INSERT INTO usuario (identificacion, nombre, apellido, email, telefono, usuario, clave, id_perfil) "
                 + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = cn.crearConexion();
             PreparedStatement ps = con.prepareStatement(q)) {

            ps.setInt(1, u.getIdentificacion());
            ps.setString(2, u.getNombre());
            ps.setString(3, u.getApellido());
            ps.setString(4, u.getEmail());
            ps.setString(5, u.getTelefono());
            ps.setString(6, u.getUsuario());
            ps.setString(7, u.getClave());
            ps.setInt(8, u.getPerfil());

            estatus = ps.executeUpdate();
            System.out.println("✅ Usuario registrado correctamente.");

        } catch (SQLException ex) {
            System.out.println("❌ Error al registrar usuario: " + ex.getMessage());
            ex.printStackTrace();
        }

        return estatus;
    }

    // ---------------------------------------------------------
    // MÉTODO: LISTAR USUARIOS CON NOMBRE DEL PERFIL
    // ---------------------------------------------------------
    @Override
    public List<Usuario> listarUsuarios() {
        List<Usuario> lista = new ArrayList<>();
        String q = "SELECT u.*, p.perfil as nombre_perfil " +
                   "FROM usuario u " +
                   "LEFT JOIN perfiles p ON u.id_perfil = p.idperfiles " +
                   "ORDER BY u.id DESC";

        try (Connection con = cn.crearConexion();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(q)) {

            while (rs.next()) {
                Usuario u = new Usuario();
                u.setId(rs.getInt("id"));
                u.setIdentificacion(rs.getInt("identificacion"));
                u.setNombre(rs.getString("nombre"));
                u.setApellido(rs.getString("apellido"));
                u.setEmail(rs.getString("email"));
                u.setTelefono(rs.getString("telefono"));
                u.setUsuario(rs.getString("usuario"));
                u.setClave(rs.getString("clave"));
                u.setPerfil(rs.getInt("id_perfil"));
                lista.add(u);
            }

        } catch (SQLException e) {
            System.out.println("❌ Error al listar usuarios: " + e.getMessage());
            e.printStackTrace();
        }

        return lista;
    }

    // ---------------------------------------------------------
    // MÉTODO: ELIMINAR USUARIO
    // ---------------------------------------------------------
    @Override
    public int eliminarDatos(int identificacion) {
        int estatus = 0;
        String q = "DELETE FROM usuario WHERE identificacion = ?";

        try (Connection con = cn.crearConexion();
             PreparedStatement ps = con.prepareStatement(q)) {

            ps.setInt(1, identificacion);
            estatus = ps.executeUpdate();
            System.out.println("🗑️ Usuario eliminado correctamente.");

        } catch (SQLException e) {
            System.out.println("❌ Error al eliminar usuario: " + e.getMessage());
            e.printStackTrace();
        }

        return estatus;
    }

    // ---------------------------------------------------------
    // MÉTODO: ACTUALIZAR USUARIO
    // ---------------------------------------------------------
    @Override
    public int actualizarDatos(Usuario u) {
        int estatus = 0;
        String q = "UPDATE usuario SET nombre=?, apellido=?, email=?, telefono=?, usuario=?, clave=?, id_perfil=? "
                 + "WHERE identificacion=?";

        try (Connection con = cn.crearConexion();
             PreparedStatement ps = con.prepareStatement(q)) {

            ps.setString(1, u.getNombre());
            ps.setString(2, u.getApellido());
            ps.setString(3, u.getEmail());
            ps.setString(4, u.getTelefono());
            ps.setString(5, u.getUsuario());
            ps.setString(6, u.getClave());
            ps.setInt(7, u.getPerfil());
            ps.setInt(8, u.getIdentificacion());

            estatus = ps.executeUpdate();
            System.out.println("📝 Usuario actualizado correctamente.");

        } catch (SQLException e) {
            System.out.println("❌ Error al actualizar usuario: " + e.getMessage());
            e.printStackTrace();
        }

        return estatus;
    }

    // ---------------------------------------------------------
    // MÉTODO: OBTENER USUARIO POR ID
    // ---------------------------------------------------------
    @Override
    public Usuario listarDatos_Id(int identificacion) {
        Usuario u = null;
        String q = "SELECT * FROM usuario WHERE identificacion=?";

        try (Connection con = cn.crearConexion();
             PreparedStatement ps = con.prepareStatement(q)) {

            ps.setInt(1, identificacion);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    u = new Usuario();
                    u.setId(rs.getInt("id"));
                    u.setIdentificacion(rs.getInt("identificacion"));
                    u.setNombre(rs.getString("nombre"));
                    u.setApellido(rs.getString("apellido"));
                    u.setEmail(rs.getString("email"));
                    u.setTelefono(rs.getString("telefono"));
                    u.setUsuario(rs.getString("usuario"));
                    u.setClave(rs.getString("clave"));
                    u.setPerfil(rs.getInt("id_perfil"));
                }
            }

        } catch (SQLException e) {
            System.out.println("❌ Error al obtener usuario: " + e.getMessage());
            e.printStackTrace();
        }

        return u;
    }
    
    // ---------------------------------------------------------
    // MÉTODO AUXILIAR: OBTENER NOMBRE DEL PERFIL
    // ---------------------------------------------------------
    public String obtenerNombrePerfil(int idPerfil) {
        String nombrePerfil = "Desconocido";
        String q = "SELECT perfil FROM perfiles WHERE idperfiles = ?";
        
        try (Connection con = cn.crearConexion();
             PreparedStatement ps = con.prepareStatement(q)) {
            
            ps.setInt(1, idPerfil);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                nombrePerfil = rs.getString("perfil");
            }
            
        } catch (SQLException e) {
            System.out.println("❌ Error al obtener nombre del perfil: " + e.getMessage());
        }
        
        return nombrePerfil;
    }
}