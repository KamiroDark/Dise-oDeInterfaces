<%-- 
    Document   : editarUsuario
    Created on : 13/10/2025, 10:46:52?p. m.
    Author     : camiloprieto
--%>

<%@page import="co.edu.konradlorenz.modelo.Usuario"%>
<%@page import="co.edu.konradlorenz.modelo.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Usuario</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 40px;
                background-color: #f5f5f5;
            }
            form {
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                width: 400px;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
            }
            h2 {
                color: #333;
            }
            label {
                display: block;
                margin-top: 10px;
            }
            input, select {
                width: 100%;
                padding: 8px;
                margin-top: 5px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }
            button {
                margin-top: 15px;
                padding: 10px 15px;
                background-color: #007BFF;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            button:hover {
                background-color: #0056b3;
            }
            a {
                display: inline-block;
                margin-top: 15px;
                text-decoration: none;
                color: #007BFF;
            }
        </style>
    </head>
    <body>

        <%
            int identificacion = Integer.parseInt(request.getParameter("identificacion"));
            UsuarioDAO dao = new UsuarioDAO();
            Usuario u = dao.listarDatos_Id(identificacion);
        %>

        <h2>Editar Usuario</h2>

        <form action="ControladorUsuario" method="post">
            <input type="hidden" name="accion" value="actualizar">
            <input type="hidden" name="identificacion" value="<%=u.getIdentificacion()%>">

            <label>Nombre:</label>
            <input type="text" name="nombre" value="<%=u.getNombre()%>" required><br><br>

            <label>Apellido:</label>
            <input type="text" name="apellido" value="<%=u.getApellido()%>" required><br><br>

            <label>Email:</label>
            <input type="email" name="email" value="<%=u.getEmail()%>" required><br><br>

            <label>Teléfono:</label>
            <input type="text" name="telefono" value="<%=u.getTelefono()%>"><br><br>

            <label>Usuario:</label>
            <input type="text" name="usuario" value="<%=u.getUsuario()%>" required><br><br>

            <label>Clave:</label>
            <input type="password" name="clave" value="<%=u.getClave()%>" required><br><br>

            <label>Perfil:</label>
            <select name="perfil">
                <option value="Administrador" <%= "Administrador".equals(u.getPerfil()) ? "selected" : ""%>>Administrador</option>
                <option value="Empleado" <%= "Empleado".equals(u.getPerfil()) ? "selected" : ""%>>Empleado</option>
                <option value="Cliente" <%= "Cliente".equals(u.getPerfil()) ? "selected" : ""%>>Cliente</option>
            </select><br><br>

            <button type="submit">Actualizar</button>
        </form>

        <a href="listarUsuarios.jsp">← Volver</a>

    </body>
</html>