/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.konradlorenz.modelo;

import co.edu.konradlorenz.interfaces.CRUD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author camiloprieto
 */
public class UsuarioDAO implements CRUD {

    @Override
    public int agregarUsuario(Usuario u) {
        Conexion cn = new Conexion();
        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        int estatus = 0;

        try {
            con = cn.crearConexion();
            String q = "INSERT INTO datos (identificacion, nombre, apellido, email, usuario, clave, id_perfil)" + "values( ?,  ?,  ?,  ?,  ?,  ?,  ?)";

        ps = con.prepareStatement(q);

            ps.setString(1, u.getIdentificacion());
            ps.setString(2, u.getNombre());
            ps.setString(3, u.getApellido());
            ps.setString(4, u.getEmail());
            ps.setString(5, u.getUsuario());
            ps.setString(6, u.getClave());
            ps.setInt(7, u.getIdperfil());

            estatus = ps.executeUpdate();
            con.close();

            System.out.print("REGISTRO GUARDADO DE FORMA EXITOSA...");

        } catch (SQLException ex) {
            System.out.print("ERROR AL REGISTRAR LA ACTIVIDAD...");
            System.out.print(ex.getMessage());
        }
        return estatus;
    }

    @Override
    public int actualizarDatos(Usuario u) {

        return 0;

    }

    @Override
    public int eliminarDatos(int id) {

        return 0;

    }

    @Override
    public Usuario listarDatos_Id(int id) {

        return null;

    }

}
