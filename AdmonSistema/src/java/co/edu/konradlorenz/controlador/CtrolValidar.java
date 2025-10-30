/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package co.edu.konradlorenz.controlador;

import co.edu.konradlorenz.modelo.LoginDAO;
import co.edu.konradlorenz.modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author camiloprieto
 */
@WebServlet(name = "CtrolValidar", urlPatterns = {"/CtrolValidar"})
public class CtrolValidar extends HttpServlet {

    LoginDAO logindao = new LoginDAO();
    Usuario datos = new Usuario();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");

        if (accion.equalsIgnoreCase("Ingresar")) {
            String usu = request.getParameter("cusuario");
            String cla = request.getParameter("cclave");
            datos = logindao.Login_datos(usu, cla);

            if (datos != null && datos.getUsuario() != null) {
                // Crear sesión con todos los datos del usuario
                HttpSession sesion = request.getSession(true);
                sesion.setAttribute("nUsuario", datos.getUsuario());  // ← AGREGAR ESTA LÍNEA
                sesion.setAttribute("usuario", datos.getUsuario());
                sesion.setAttribute("nombre", datos.getNombre());
                sesion.setAttribute("apellido", datos.getApellido());
                sesion.setAttribute("perfil", datos.getPerfil());
                sesion.setAttribute("datosCompletos", datos);

                request.getRequestDispatcher("cpanel.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Usuario o contraseña incorrectos");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        } else {
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
