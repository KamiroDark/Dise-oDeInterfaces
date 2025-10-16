<%-- 
    Document   : listarUsuarios.jsp
    Created on : 13/10/2025, 10:40:09?p. m.
    Author     : camiloprieto
--%>

<%@page import="java.util.List"%>
<%@page import="co.edu.konradlorenz.modelo.Usuario"%>
<%@page import="co.edu.konradlorenz.modelo.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Lista de Usuarios</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 30px; background-color: #f5f5f5; }
        table { border-collapse: collapse; width: 90%; background-color: #fff; box-shadow: 0 0 8px rgba(0,0,0,0.1); }
        th, td { padding: 10px; text-align: left; border-bottom: 1px solid #ddd; }
        th { background-color: #007BFF; color: white; }
        tr:hover { background-color: #f1f1f1; }
        a { text-decoration: none; color: #007BFF; font-weight: bold; }
        a:hover { text-decoration: underline; }
        h2 { color: #333; }
        .btn { padding: 5px 10px; border-radius: 5px; }
        .editar { color: green; }
        .eliminar { color: red; }
    </style>
</head>
<body>
    <h2>Lista de Usuarios Registrados</h2>

    <%
        UsuarioDAO dao = new UsuarioDAO();
        List<Usuario> lista = dao.listarUsuarios();
    %>

    <table>
        <tr>
            <th>Identificación</th>
            <th>Nombre</th>
            <th>Apellido</th>
            <th>Email</th>
            <th>Teléfono</th>
            <th>Usuario</th>
            <th>Clave</th>
            <th>Perfil</th>
            <th>Acciones</th>
        </tr>

        <% for (Usuario u : lista) { %>
        <tr>
            <td><%=u.getIdentificacion()%></td>
            <td><%=u.getNombre()%></td>
            <td><%=u.getApellido()%></td>
            <td><%=u.getEmail()%></td>
            <td><%=u.getTelefono()%></td>
            <td><%=u.getUsuario()%></td>
            <td><%=u.getClave()%></td>
            <td><%=u.getPerfil()%></td>
            <td>
                <a class="editar" href="editarUsuario.jsp?identificacion=<%=u.getIdentificacion()%>">Editar</a> |
                <a class="eliminar" href="ControladorUsuario?accion=eliminar&identificacion=<%=u.getIdentificacion()%>">Eliminar</a>
            </td>
        </tr>
        <% } %>
    </table>

    <br><br>
    <a href="index.jsp">← Volver al formulario</a>
</body>
</html>
