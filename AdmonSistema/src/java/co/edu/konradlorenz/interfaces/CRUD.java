/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package co.edu.konradlorenz.interfaces;

import co.edu.konradlorenz.modelo.Usuario;

/**
 *
 * @author camiloprieto
 */
public interface CRUD {

    public int agregarUsuario(Usuario u);

    public int actualizarDatos(Usuario u);

    public int eliminarDatos(int id);

    public Usuario listarDatos_Id(int id);
    
}
