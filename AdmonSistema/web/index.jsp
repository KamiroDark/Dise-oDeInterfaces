<%-- 
    Document   : index
    Created on : 25/09/2025, 5:12:19 p. m.
    Author     : camiloprieto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro Usuarios</title>
    </head>
    <body>
        <h1>Bienvenido!!</h1>
        <h2>Formulario de Registro</h2>
    <form action="controladorUsuario" method="post">
        <label>Identificación:</label>
        <input type="text" name="cidentificacion" required><br><br>

        <label>Nombre:</label>
        <input type="text" name="cnombre" required><br><br>

        <label>Apellido:</label>
        <input type="text" name="capellido" required><br><br>

        <label>Email:</label>
        <input type="email" name="cmail" required><br><br>

        <label>Teléfono:</label>
        <input type="text" name="ctelefono"><br><br>

        <label>Usuario:</label>
        <input type="text" name="cusuario" required><br><br>

        <label>Clave:</label>
        <input type="password" name="cclave" required><br><br>

        <label>ID Perfil:</label>
        <input type="number" name="cidperfil" required><br><br>

        <button type="submit">Guardar</button>
    </form>
    </body>
</html>
