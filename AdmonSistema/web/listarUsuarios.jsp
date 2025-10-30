<%-- 
    Document   : listarUsuarios.jsp
    Created on : 13/10/2025, 10:40:09?p. m.
    Author     : camiloprieto
--%>

<%@page import="java.util.List"%>
<%@page import="co.edu.konradlorenz.modelo.Usuario"%>
<%@page import="co.edu.konradlorenz.modelo.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Verificar sesión
    HttpSession sesion = request.getSession(false);
    if (sesion == null || sesion.getAttribute("usuario") == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Gestión de Usuarios</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                min-height: 100vh;
                padding: 20px;
            }

            .container {
                max-width: 1400px;
                margin: 0 auto;
                background: white;
                border-radius: 20px;
                padding: 30px;
                box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
            }

            .header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 30px;
                padding-bottom: 20px;
                border-bottom: 3px solid #667eea;
            }

            .header h1 {
                color: #2d3748;
                font-size: 2em;
            }

            .header h1::before {
                content: '👥 ';
            }

            .btn {
                padding: 12px 25px;
                border: none;
                border-radius: 25px;
                font-weight: 600;
                cursor: pointer;
                text-decoration: none;
                display: inline-flex;
                align-items: center;
                gap: 8px;
                transition: all 0.3s ease;
                font-size: 0.95em;
            }

            .btn-primary {
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                color: white;
            }

            .btn-primary:hover {
                transform: translateY(-2px);
                box-shadow: 0 10px 25px rgba(102, 126, 234, 0.4);
            }

            .btn-success {
                background: linear-gradient(135deg, #84fab0 0%, #8fd3f4 100%);
                color: #2d3748;
            }

            .btn-danger {
                background: linear-gradient(135deg, #fa709a 0%, #fee140 100%);
                color: white;
            }

            .btn-secondary {
                background: #e2e8f0;
                color: #4a5568;
            }

            .btn-secondary:hover {
                background: #cbd5e0;
            }

            .stats {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
                gap: 20px;
                margin-bottom: 30px;
            }

            .stat-card {
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                padding: 20px;
                border-radius: 15px;
                color: white;
                text-align: center;
            }

            .stat-number {
                font-size: 2.5em;
                font-weight: 700;
                margin: 10px 0;
            }

            .stat-label {
                font-size: 0.9em;
                opacity: 0.9;
            }

            .table-container {
                overflow-x: auto;
                border-radius: 15px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.07);
            }

            table {
                width: 100%;
                border-collapse: collapse;
                background: white;
            }

            thead {
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                color: white;
            }

            th {
                padding: 15px;
                text-align: left;
                font-weight: 600;
                font-size: 0.9em;
                text-transform: uppercase;
                letter-spacing: 0.5px;
            }

            td {
                padding: 15px;
                border-bottom: 1px solid #e2e8f0;
                color: #4a5568;
            }

            tbody tr {
                transition: all 0.3s ease;
            }

            tbody tr:hover {
                background: #f7fafc;
                transform: scale(1.01);
            }

            .badge {
                display: inline-block;
                padding: 5px 12px;
                border-radius: 15px;
                font-size: 0.85em;
                font-weight: 600;
            }

            .badge-admin {
                background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
                color: white;
            }

            .badge-empleado {
                background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
                color: white;
            }

            .badge-cliente {
                background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%);
                color: white;
            }

            .actions {
                display: flex;
                gap: 8px;
            }

            .btn-small {
                padding: 6px 12px;
                font-size: 0.85em;
                border-radius: 15px;
            }

            .empty-state {
                text-align: center;
                padding: 60px 20px;
                color: #718096;
            }

            .empty-state-icon {
                font-size: 4em;
                margin-bottom: 20px;
            }

            @media (max-width: 768px) {
                .header {
                    flex-direction: column;
                    gap: 15px;
                    text-align: center;
                }

                .stats {
                    grid-template-columns: 1fr;
                }

                table {
                    font-size: 0.85em;
                }

                th, td {
                    padding: 10px 8px;
                }
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="header">
                <h1>Gestión de Usuarios</h1>
                <div style="display: flex; gap: 10px;">
                    <a href="Registro.jsp" class="btn btn-primary">
                        ➕ Nuevo Usuario
                    </a>
                    <a href="cpanel.jsp" class="btn btn-secondary">
                        🏠 Volver al Dashboard
                    </a>
                </div>
            </div>

            <%
                UsuarioDAO dao = new UsuarioDAO();
                List<Usuario> lista = dao.listarUsuarios();

                // Contar usuarios por perfil
                int totalUsuarios = lista.size();
                int admins = 0;
                int empleados = 0;
                int clientes = 0;

                for (Usuario usr : lista) {
                    int perfilId = usr.getPerfil();
                    if (perfilId == 1) {
                        admins++;
                    } else if (perfilId == 2) {
                        empleados++;
                    } else if (perfilId == 3) {
                        clientes++;
                    }
                }
            %>

            <div class="stats">
                <div class="stat-card">
                    <div class="stat-label">Total Usuarios</div>
                    <div class="stat-number"><%=totalUsuarios%></div>
                </div>
                <div class="stat-card" style="background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);">
                    <div class="stat-label">Administradores</div>
                    <div class="stat-number"><%=admins%></div>
                </div>
                <div class="stat-card" style="background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);">
                    <div class="stat-label">Empleados</div>
                    <div class="stat-number"><%=empleados%></div>
                </div>
                <div class="stat-card" style="background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%);">
                    <div class="stat-label">Clientes</div>
                    <div class="stat-number"><%=clientes%></div>
                </div>
            </div>

            <% if (lista.isEmpty()) { %>
            <div class="empty-state">
                <div class="empty-state-icon">📭</div>
                <h3>No hay usuarios registrados</h3>
                <p>Comienza agregando tu primer usuario</p>
                <br>
                <a href="Registro.jsp" class="btn btn-primary">➕ Agregar Usuario</a>
            </div>
            <% } else { %>
            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Identificación</th>
                            <th>Nombre Completo</th>
                            <th>Email</th>
                            <th>Teléfono</th>
                            <th>Usuario</th>
                            <th>Perfil</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (Usuario usr : lista) {
                                String nombrePerfil = dao.obtenerNombrePerfil(usr.getPerfil());
                                String badgeClass = "";

                                int perfilId = usr.getPerfil();
                                if (perfilId == 1) {
                                    badgeClass = "badge-admin";
                                } else if (perfilId == 2) {
                                    badgeClass = "badge-empleado";
                                } else if (perfilId == 3) {
                                    badgeClass = "badge-cliente";
                                } else {
                                    badgeClass = "badge-cliente";
                                }
                        %>
                        <tr>
                            <td><strong>#<%=usr.getId()%></strong></td>
                            <td><%=usr.getIdentificacion()%></td>
                            <td><strong><%=usr.getNombre()%> <%=usr.getApellido()%></strong></td>
                            <td><%=usr.getEmail()%></td>
                            <td><%=usr.getTelefono() != null ? usr.getTelefono() : "-"%></td>
                            <td><code><%=usr.getUsuario()%></code></td>
                            <td>
                                <span class="badge <%=badgeClass%>">
                                    <%=nombrePerfil%>
                                </span>
                            </td>
                            <td>
                                <div class="actions">
                                    <a href="editarUsuario.jsp?identificacion=<%=usr.getIdentificacion()%>" 
                                       class="btn btn-success btn-small">
                                        ✏️ Editar
                                    </a>
                                    <a href="ControladorUsuario?accion=eliminar&identificacion=<%=usr.getIdentificacion()%>" 
                                       class="btn btn-danger btn-small"
                                       onclick="return confirm('¿Estás seguro de eliminar a <%=usr.getNombre()%> <%=usr.getApellido()%>?');">
                                        🗑️ Eliminar
                                    </a>
                                </div>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
            <% }%>
        </div>
    </body>
</html>