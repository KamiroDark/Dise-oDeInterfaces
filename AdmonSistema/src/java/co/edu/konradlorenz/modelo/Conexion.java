/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.konradlorenz.modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author camiloprieto
 */
public class Conexion {

    public static String usuario = "root";
    public static String clave = "admin1234";
    public static String servidor = "127.0.0.1"; 
    public static String puerto = "3306";
    public static String BD = "laboratorio5";

    public Connection crearConexion() {
        Connection con = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String URL = "jdbc:mysql://" + servidor + ":" + puerto + "/" + BD
                       + "?useSSL=false&serverTimezone=UTC";
            con = DriverManager.getConnection(URL, usuario, clave);
            System.out.println("✅ Conectado a la base de datos.");
        } catch (ClassNotFoundException ex) {
            System.out.println("❌ Error: no se encontró el driver JDBC -> " + ex.getMessage());
        } catch (SQLException e) {
            System.out.println("❌ Error SQL: " + e.getMessage());
            e.printStackTrace();
        }

        return con;
    }
}
