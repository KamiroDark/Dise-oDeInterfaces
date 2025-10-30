<%-- 
    Document   : Registro
    Created on : 23/10/2025, 6:48:04 p. m.
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
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Registro de Usuario</title>
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
                content: '👤 ';
            }

            .header p {
                color: #718096;
                font-size: 0.95em;
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

            .info-box {
                background: linear-gradient(135deg, #667eea15 0%, #764ba215 100%);
                padding: 15px;
                border-radius: 10px;
                border-left: 4px solid #667eea;
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

            /* Iconos para los campos */
            .icon-perfil {
                font-size: 1.2em;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="header">
                <h1>Registrar Nuevo Usuario</h1>
                <p>Complete el formulario para agregar un usuario al sistema</p>
            </div>

            <div class="info-box">
                <p><strong>📋 Nota:</strong> Todos los campos marcados con <span style="color: #e53e3e;">*</span> son obligatorios</p>
            </div>

            <form action="ControladorUsuario" method="post">
                <input type="hidden" name="accion" value="agregar">

                <div class="form-grid">
                    <div class="form-group">
                        <label>
                            🆔 Identificación <span class="required">*</span>
                        </label>
                        <input type="number" 
                               name="cidentificacion" 
                               placeholder="Ej: 1234567890"
                               required 
                               min="1">
                    </div>

                    <div class="form-group">
                        <label>
                            📧 Email <span class="required">*</span>
                        </label>
                        <input type="email" 
                               name="cmail" 
                               placeholder="usuario@ejemplo.com"
                               required>
                    </div>

                    <div class="form-group">
                        <label>
                            👤 Nombre <span class="required">*</span>
                        </label>
                        <input type="text" 
                               name="cnombre" 
                               placeholder="Nombre"
                               required>
                    </div>

                    <div class="form-group">
                        <label>
                            👤 Apellido <span class="required">*</span>
                        </label>
                        <input type="text" 
                               name="capellido" 
                               placeholder="Apellido"
                               required>
                    </div>

                    <div class="form-group">
                        <label>
                            📱 Teléfono
                        </label>
                        <input type="text" 
                               name="ctelefono" 
                               placeholder="Ej: 3001234567">
                    </div>

                    <div class="form-group">
                        <label>
                            🔑 Nombre de Usuario <span class="required">*</span>
                        </label>
                        <input type="text" 
                               name="cusuario" 
                               placeholder="usuario123"
                               required>
                    </div>

                    <div class="form-group full-width">
                        <label>
                            🔒 Contraseña <span class="required">*</span>
                        </label>
                        <input type="password" 
                               name="cclave" 
                               placeholder="••••••••"
                               required
                               minlength="4">
                        <div class="password-hint">Mínimo 4 caracteres</div>
                    </div>

                    <div class="form-group full-width">
                        <label>
                            <span class="icon-perfil">👑</span> Perfil de Usuario <span class="required">*</span>
                        </label>
                        <select name="perfil" required>
                            <option value="">-- Seleccione un perfil --</option>
                            <option value="1">👑 Administrador</option>
                            <option value="2">💼 Empleado</option>
                            <option value="3">👤 Cliente</option>
                        </select>
                    </div>
                </div>

                <div class="btn-group">
                    <button type="submit" class="btn btn-primary">
                        ✅ Guardar Usuario
                    </button>
                    <a href="listarUsuarios.jsp" class="btn btn-secondary">
                        ❌ Cancelar
                    </a>
                </div>
            </form>
        </div>
    </body>
</html>