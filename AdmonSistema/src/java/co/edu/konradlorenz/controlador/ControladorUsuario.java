package co.edu.konradlorenz.controlador;

import co.edu.konradlorenz.modelo.Usuario;
import co.edu.konradlorenz.modelo.UsuarioDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "ControladorUsuario", urlPatterns = {"/ControladorUsuario"})
public class ControladorUsuario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        String accion = request.getParameter("accion");
        UsuarioDAO dao = new UsuarioDAO();

        try {
            // 🔹 Acción por defecto: agregar usuario
            if (accion == null || accion.equals("agregar")) {

                int identificacion = Integer.parseInt(request.getParameter("cidentificacion"));
                String nombre = request.getParameter("cnombre");
                String apellido = request.getParameter("capellido");
                String email = request.getParameter("cmail");
                String telefono = request.getParameter("ctelefono");
                String usuario = request.getParameter("cusuario");
                String clave = request.getParameter("cclave");
                String perfil = request.getParameter("cperfil");

                Usuario u = new Usuario();
                u.setIdentificacion(identificacion);
                u.setNombre(nombre);
                u.setApellido(apellido);
                u.setEmail(email);
                u.setTelefono(telefono);
                u.setUsuario(usuario);
                u.setClave(clave);
                u.setPerfil(perfil);

                int status = dao.agregarUsuario(u);

                if (status > 0) {
                    response.sendRedirect("listarUsuarios.jsp");
                } else {
                    response.getWriter().println("<h3 style='color:red;'>❌ Error al registrar usuario.</h3>");
                }

                // 🔹 Acción Actualizar
            } else if (accion.equals("actualizar")) {

                int identificacion = Integer.parseInt(request.getParameter("identificacion"));
                String nombre = request.getParameter("nombre");
                String apellido = request.getParameter("apellido");
                String email = request.getParameter("email");
                String telefono = request.getParameter("telefono");
                String usuario = request.getParameter("usuario");
                String clave = request.getParameter("clave");
                String perfil = request.getParameter("perfil");

                Usuario u = new Usuario();
                u.setIdentificacion(identificacion);
                u.setNombre(nombre);
                u.setApellido(apellido);
                u.setEmail(email);
                u.setTelefono(telefono);
                u.setUsuario(usuario);
                u.setClave(clave);
                u.setPerfil(perfil);

                int estado = dao.actualizarDatos(u);

                if (estado > 0) {
                    response.sendRedirect("listarUsuarios.jsp");
                } else {
                    response.getWriter().println("<h3 style='color:red;'>❌ No se pudo actualizar el usuario.</h3>");
                }
                //Acción Eliminar
            } else if (accion.equals("eliminar")) {

                int identificacion = Integer.parseInt(request.getParameter("identificacion"));
                int estado = dao.eliminarDatos(identificacion);

                if (estado > 0) {
                    response.sendRedirect("listarUsuarios.jsp");
                } else {
                    response.getWriter().println("<h3 style='color:red;'>❌ No se pudo eliminar el usuario.</h3>");
                }

            } else {
                response.getWriter().println("<h3 style='color:red;'>Acción no reconocida.</h3>");
            }

        } catch (NumberFormatException e) {
            response.getWriter().println("<h3 style='color:red;'>Error: ID no válido o faltante.</h3>");
        } catch (Exception e) {
            response.getWriter().println("<h3 style='color:red;'>Error general: " + e.getMessage() + "</h3>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Controlador de Usuario - CRUD";
    }
}
