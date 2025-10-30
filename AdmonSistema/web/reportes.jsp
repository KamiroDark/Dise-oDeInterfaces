<%-- 
    Document   : reportes
    Created on : 30/10/2025
    Author     : camiloprieto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Verificar sesión
    HttpSession sesion = request.getSession(false);
    if (sesion == null || sesion.getAttribute("usuario") == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    // Datos de sesión (puedes adaptarlo según tu controlador)
    String nombre = (String) sesion.getAttribute("nombre");
    String perfil = sesion.getAttribute("perfil") != null ? sesion.getAttribute("perfil").toString() : "0";

    // Solo admin debería ver este panel (opcional)
    if (!perfil.equals("1")) {
        response.sendRedirect("miPerfil.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Reportes del Sistema</title>
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
                width: 90%;
                max-width: 900px;
            }

            h1 {
                color: #2d3748;
                text-align: center;
                margin-bottom: 25px;
            }

            .info {
                text-align: center;
                color: #718096;
                margin-bottom: 25px;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                border-radius: 10px;
                overflow: hidden;
            }

            th, td {
                padding: 12px 15px;
                text-align: left;
            }

            th {
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                color: white;
            }

            tr:nth-child(even) {
                background-color: #f7fafc;
            }

            tr:hover {
                background-color: #edf2f7;
            }

            .btn {
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                color: white;
                border: none;
                padding: 10px 18px;
                border-radius: 20px;
                cursor: pointer;
                font-weight: 600;
                transition: all 0.3s ease;
            }

            .btn:hover {
                transform: translateY(-2px);
                box-shadow: 0 10px 25px rgba(102, 126, 234, 0.4);
            }

            .top-bar {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 20px;
            }

            .user {
                color: #4a5568;
                font-size: 0.9em;
            }

            @media (max-width: 700px) {
                .top-bar {
                    flex-direction: column;
                    gap: 10px;
                }

                th, td {
                    font-size: 0.85em;
                }
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="top-bar">
                <div class="user">
                    👑 Bienvenido, <strong><%= nombre != null ? nombre : "Administrador"%></strong>
                </div>
                <form action="CerrarSesion" method="post">
                    <button class="btn" type="submit">🚪 Cerrar Sesión</button>
                </form>
            </div>

            <h1>📊 Reportes del Sistema</h1>
            <div class="info">
                <p>Visualiza los registros y estadísticas recientes del sistema.</p>
            </div>

            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Tipo de Reporte</th>
                        <th>Fecha</th>
                        <th>Responsable</th>
                        <th>Acción</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>101</td>
                        <td>Usuarios Registrados</td>
                        <td>2025-10-28</td>
                        <td>Admin</td>
                        <td><button class="btn">Ver</button></td>
                    </tr>
                    <tr>
                        <td>102</td>
                        <td>Pedidos Completados</td>
                        <td>2025-10-29</td>
                        <td>Empleado</td>
                        <td><button class="btn">Ver</button></td>
                    </tr>
                    <tr>
                        <td>103</td>
                        <td>Errores del Sistema</td>
                        <td>2025-10-30</td>
                        <td>Admin</td>
                        <td><button class="btn">Ver</button></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </body>
</html>