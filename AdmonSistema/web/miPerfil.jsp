<%-- 
    Document   : miPerfil
    Created on : 30/10/2025
    Author     : camiloprieto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion = request.getSession(false);
    if (sesion == null || sesion.getAttribute("usuario") == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    // Datos simulados o cargados desde sesión
    Object perfilObj = sesion.getAttribute("perfil");
    String perfil = (perfilObj != null) ? perfilObj.toString() : null;

    String nombre = (String) sesion.getAttribute("nombre");
    String apellido = (String) sesion.getAttribute("apellido");
    String correo = (String) sesion.getAttribute("correo");
    String usuario = (String) sesion.getAttribute("usuario");
%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Mi Perfil</title>
        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                min-height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                padding: 20px;
            }

            .container {
                background: white;
                border-radius: 20px;
                padding: 40px;
                box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
                max-width: 600px;
                width: 100%;
                text-align: center;
            }

            h1 {
                color: #2d3748;
                font-size: 2em;
                margin-bottom: 15px;
            }

            .avatar {
                width: 120px;
                height: 120px;
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                border-radius: 50%;
                display: inline-flex;
                justify-content: center;
                align-items: center;
                color: white;
                font-size: 3em;
                font-weight: bold;
                margin-bottom: 20px;
                box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            }

            .info {
                text-align: left;
                margin-top: 20px;
            }

            .info p {
                margin: 10px 0;
                color: #4a5568;
                font-size: 1em;
            }

            .btn-group {
                display: flex;
                gap: 15px;
                margin-top: 30px;
            }

            .btn {
                flex: 1;
                padding: 14px 25px;
                border: none;
                border-radius: 25px;
                font-weight: 600;
                cursor: pointer;
                font-size: 1em;
                transition: all 0.3s ease;
            }

            .btn-primary {
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                color: white;
            }

            .btn-primary:hover {
                transform: translateY(-2px);
                box-shadow: 0 10px 25px rgba(102, 126, 234, 0.4);
            }

            .btn-secondary {
                background: #e2e8f0;
                color: #4a5568;
            }

            .btn-secondary:hover {
                background: #cbd5e0;
            }

            @media (max-width: 600px) {
                .container {
                    padding: 25px;
                }

                .btn-group {
                    flex-direction: column;
                }
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="avatar">
                <%= (nombre != null && !nombre.isEmpty()) ? nombre.substring(0, 1).toUpperCase() : "U"%>
            </div>
            <h1><%= nombre != null ? nombre + " " + apellido : "Usuario"%></h1>
            <p style="color: #718096;"><%= perfil != null ? perfil : "Perfil no asignado"%></p>

            <div class="info">
                <p>📧 <strong>Correo:</strong> <%= correo != null ? correo : "Sin registrar"%></p>
                <p>👤 <strong>Usuario:</strong> <%= usuario != null ? usuario : "Sin nombre de usuario"%></p>
            </div>

            <div class="btn-group">
                <form action="editarUsuario.jsp" method="get" style="flex:1;">
                    <button class="btn btn-primary" type="submit">✏️ Editar Perfil</button>
                </form>
                <form action="CerrarSesion" method="post" style="flex:1;">
                    <button class="btn btn-secondary" type="submit">🚪 Cerrar Sesión</button>
                </form>
            </div>
        </div>
    </body>
</html>