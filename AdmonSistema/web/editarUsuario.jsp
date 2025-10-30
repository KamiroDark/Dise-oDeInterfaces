<%-- 
    Document   : editarUsuario
    Created on : 13/10/2025, 10:46:52?p. m.
    Author     : camiloprieto
--%>

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

    // Obtener el usuario a editar
    int identificacion = Integer.parseInt(request.getParameter("identificacion"));
    UsuarioDAO dao = new UsuarioDAO();
    Usuario u = dao.listarDatos_Id(identificacion);

    if (u == null) {
        response.sendRedirect("listarUsuarios.jsp");
        return;
    }

    String nombrePerfil = dao.obtenerNombrePerfil(u.getPerfil());
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Editar Usuario - <%=u.getNombre()%> <%=u.getApellido()%></title>
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
            }

            .header {
                text-align: center;
                margin-bottom: 30px;
            }

            .header h1 {
                color: #2d3748;
                font-size: 2em;
                margin-bottom: 10px;
            }

            .header h1::before {
                content: '✏️ ';
            }

            .user-badge {
                display: inline-block;
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                color: white;
                padding: 8px 20px;
                border-radius: 20px;
                font-size: 0.9em;
                font-weight: 600;
                margin-top: 10px;
            }

            .form-grid {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
                gap: 20px;
            }

            .form-group {
                display: flex;
                flex-direction: column;
                gap: 8px;
            }

            .form-group.full-width {
                grid-column: 1 / -1;
            }

            label {
                font-weight: 600;
                color: #2d3748;
                font-size: 0.9em;
                display: flex;
                align-items: center;
                gap: 5px;
            }

            label .required {
                color: #e53e3e;
            }

            input, select {
                padding: 12px 15px;
                border: 2px solid #e2e8f0;
                border-radius: 10px;
                font-size: 0.95em;
                transition: all 0.3s ease;
                font-family: inherit;
            }

            input:focus, select:focus {
                outline: none;
                border-color: #667eea;
                box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
            }

            input:hover, select:hover {
                border-color: #cbd5e0;
            }

            input[readonly] {
                background: #f7fafc;
                cursor: not-allowed;
            }

            select {
                cursor: pointer;
                background: white;
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
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 8px;
                text-decoration: none;
            }

            .btn-success {
                background: linear-gradient(135deg, #84fab0 0%, #8fd3f4 100%);
                color: #2d3748;
            }

            .btn-success:hover {
                transform: translateY(-2px);
                box-shadow: 0 10px 25px rgba(132, 250, 176, 0.4);
            }

            .btn-secondary {
                background: #e2e8f0;
                color: #4a5568;
            }

            .btn-secondary:hover {
                background: #cbd5e0;
            }

            .info-box {
                background: linear-gradient(135deg, #84fab015 0%, #8fd3f415 100%);
                padding: 15px;
                border-radius: 10px;
                border-left: 4px solid #84fab0;
                margin-bottom: 25px;
            }

            .info-box p {
                color: #4a5568;
                font-size: 0.9em;
                line-height: 1.6;
            }

            .password-hint {
                font-size: 0.85em;
                color: #718096;
                margin-top: 5px;
            }

            .field-hint {
                font-size: 0.85em;
                color: #718096;
                font-style: italic;
            }

            @media (max-width: 600px) {
                .container {
                    padding: 25px;
                }

                .form-grid {
                    grid-template-columns: 1fr;
                }

                .btn-group {
                    flex-direction: column;
                }
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="header">
                <h1>Editar Usuario</h1>
                <div class="user-badge">
                    ID: <%=u.getIdentificacion()%> - <%=nombrePerfil%>
                </div>
            </div>

            <div class="info-box">
                <p><strong>📝 Editando:</strong> <%=u.getNombre()%> <%=u.getApellido()%></p>
                <p style="margin-top: 5px;"><strong>Usuario:</strong> <%=u.getUsuario()%></p>
            </div>

            <form action="ControladorUsuario" method="post">
                <input type="hidden" name="accion" value="actualizar">
                <input type="hidden" name="identificacion" value="<%=u.getIdentificacion()%>">

                <div class="form-grid">
                    <div class="form-group full-width">
                        <label>
                            🆔 Identificación
                        </label>
                        <input type="number" 
                               value="<%=u.getIdentificacion()%>" 
                               readonly>
                        <div class="field-hint">La identificación no se puede modificar</div>
                    </div>

                    <div class="form-group">
                        <label>
                            👤 Nombre <span class="required">*</span>
                        </label>
                        <input type="text" 
                               name="nombre" 
                               value="<%=u.getNombre()%>" 
                               required>
                    </div>

                    <div class="form-group">
                        <label>
                            👤 Apellido <span class="required">*</span>
                        </label>
                        <input type="text" 
                               name="apellido" 
                               value="<%=u.getApellido()%>" 
                               required>
                    </div>

                    <div class="form-group">
                        <label>
                            📧 Email <span class="required">*</span>
                        </label>
                        <input type="email" 
                               name="email" 
                               value="<%=u.getEmail()%>" 
                               required>
                    </div>

                    <div class="form-group">
                        <label>
                            📱 Teléfono
                        </label>
                        <input type="text" 
                               name="telefono" 
                               value="<%=u.getTelefono() != null ? u.getTelefono() : ""%>">
                    </div>

                    <div class="form-group full-width">
                        <label>
                            🔑 Nombre de Usuario <span class="required">*</span>
                        </label>
                        <input type="text" 
                               name="usuario" 
                               value="<%=u.getUsuario()%>" 
                               required>
                    </div>

                    <div class="form-group full-width">
                        <label>
                            🔒 Contraseña <span class="required">*</span>
                        </label>
                        <input type="password" 
                               name="clave" 
                               value="<%=u.getClave()%>" 
                               required
                               minlength="4">
                        <div class="password-hint">Deja la contraseña actual o cámbiala (mínimo 4 caracteres)</div>
                    </div>

                    <div class="form-group full-width">
                        <label>
                            👑 Perfil de Usuario <span class="required">*</span>
                        </label>
                        <select name="perfil" required>
                            <option value="1" <%= u.getPerfil() == 1 ? "selected" : ""%>>
                                👑 Administrador
                            </option>
                            <option value="2" <%= u.getPerfil() == 2 ? "selected" : ""%>>
                                💼 Empleado
                            </option>
                            <option value="3" <%= u.getPerfil() == 3 ? "selected" : ""%>>
                                👤 Cliente
                            </option>
                        </select>
                    </div>
                </div>

                <div class="btn-group">
                    <button type="submit" class="btn btn-success">
                        💾 Guardar Cambios
                    </button>
                    <a href="listarUsuarios.jsp" class="btn btn-secondary">
                        ❌ Cancelar
                    </a>
                </div>
            </form>
        </div>
    </body>
</html>