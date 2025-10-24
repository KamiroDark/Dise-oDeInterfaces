<%-- 
    Document   : Registro
    Created on : 23/10/2025, 6:48:04 p. m.
    Author     : camiloprieto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de Usuarios</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f6f8;
                margin: 0;
                padding: 0;
                display: flex;
                flex-direction: column;
                align-items: center;
            }
            header {
                background-color: #0056b3;
                color: white;
                width: 100%;
                text-align: center;
                padding: 15px 0;
                font-size: 1.5em;
                font-weight: bold;
            }
            nav {
                margin: 20px 0;
            }
            nav a {
                margin: 0 10px;
                text-decoration: none;
                background: #007bff;
                color: white;
                padding: 8px 15px;
                border-radius: 8px;
                font-weight: bold;
                transition: 0.3s;
            }
            nav a:hover {
                background: #0056b3;
            }
            form {
                background: white;
                padding: 30px 50px;
                border-radius: 15px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
                width: 400px;
            }
            label {
                font-weight: bold;
            }
            input {
                width: 100%;
                padding: 8px;
                margin: 5px 0 15px 0;
                border-radius: 6px;
                border: 1px solid #ccc;
            }
            button {
                background: #28a745;
                color: white;
                border: none;
                padding: 10px 15px;
                border-radius: 6px;
                cursor: pointer;
                font-weight: bold;
                width: 100%;
            }
            button:hover {
                background: #218838;
            }
            footer {
                margin-top: 40px;
                color: gray;
                font-size: 0.9em;
            }
        </style>
    </head>

    <body>
        <header>Panel de Administración de Usuarios</header>

        <nav>
            <a href="index.jsp">🏠 Inicio</a>
            <a href="listarUsuarios.jsp">📋 Listar Usuarios</a>
            <a href="pruebaConexion.jsp">🔌 Probar Conexión</a>
        </nav>

        <h2>Formulario de Registro</h2>
        <form action="ControladorUsuario" method="post">
            <input type="hidden" name="accion" value="agregar">

            <label>Identificación:</label>
            <input type="number" name="cidentificacion" required><br><br>

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

            <label>Perfil:</label>
            <select name="cperfil">
                <option value="Administrador">Administrador</option>
                <option value="Empleado">Empleado</option>
                <option value="Cliente">Cliente</option>
            </select><br><br>

            <button type="submit">Guardar</button>

        </form>

        <footer>
            <p>Fundación Universitaria Konrad Lorenz — Proyecto CRUD JSP</p>
        </footer>
    </body>
</html>
