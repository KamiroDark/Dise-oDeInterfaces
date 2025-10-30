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
                int perfil = Integer.parseInt(request.getParameter("perfil"));

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
                    response.sendRedirect("listarUsuarios.jsp?success=Usuario registrado correctamente");
                } else {
                    response.sendRedirect("Registro.jsp?error=No se pudo registrar el usuario");
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
                int perfil = Integer.parseInt(request.getParameter("perfil"));

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
                    response.sendRedirect("listarUsuarios.jsp?success=Usuario actualizado correctamente");
                } else {
                    response.sendRedirect("listarUsuarios.jsp?error=No se pudo actualizar el usuario");
                }

                // 🔹 Acción Eliminar
            } else if (accion.equals("eliminar")) {

                int identificacion = Integer.parseInt(request.getParameter("identificacion"));
                int estado = dao.eliminarDatos(identificacion);

                if (estado > 0) {
                    response.sendRedirect("listarUsuarios.jsp?success=Usuario eliminado correctamente");
                } else {
                    response.sendRedirect("listarUsuarios.jsp?error=No se pudo eliminar el usuario");
                }

            } else {
                response.sendRedirect("listarUsuarios.jsp?error=Acción no reconocida");
            }

        } catch (NumberFormatException e) {
            response.sendRedirect("listarUsuarios.jsp?error=Datos inválidos: " + e.getMessage());
        } catch (Exception e) {
            response.sendRedirect("listarUsuarios.jsp?error=Error general: " + e.getMessage());
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
