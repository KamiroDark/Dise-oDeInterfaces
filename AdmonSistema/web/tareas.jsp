<%-- 
    Document   : tareas.jsp
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
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Tareas del Sistema</title>
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
                max-width: 1200px;
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
                content: '🗂️ ';
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

            .btn-secondary {
                background: #e2e8f0;
                color: #4a5568;
            }

            .btn-secondary:hover {
                background: #cbd5e0;
            }

            .tareas-grid {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
                gap: 20px;
            }

            .tarea-card {
                background: white;
                border-radius: 15px;
                padding: 20px;
                box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
                transition: all 0.3s ease;
                border-left: 6px solid #667eea;
            }

            .tarea-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 12px 30px rgba(0, 0, 0, 0.15);
            }

            .tarea-card h3 {
                color: #2d3748;
                margin-bottom: 10px;
            }

            .tarea-card p {
                color: #4a5568;
                font-size: 0.95em;
                margin-bottom: 15px;
            }

            .badge {
                display: inline-block;
                padding: 6px 12px;
                border-radius: 15px;
                font-size: 0.8em;
                font-weight: 600;
            }

            .badge-pendiente {
                background: linear-gradient(135deg, #fa709a 0%, #fee140 100%);
                color: #2d3748;
            }

            .badge-progreso {
                background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
                color: white;
            }

            .badge-completada {
                background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%);
                color: white;
            }

            .acciones {
                display: flex;
                gap: 10px;
            }

            .acciones .btn-small {
                padding: 8px 15px;
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

                .tareas-grid {
                    grid-template-columns: 1fr;
                }
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="header">
                <h1>Tareas del Sistema</h1>
                <div style="display: flex; gap: 10px;">
                    <a href="#" class="btn btn-primary">➕ Nueva Tarea</a>
                    <a href="cpanel.jsp" class="btn btn-secondary">🏠 Volver al Dashboard</a>
                </div>
            </div>

            <div class="tareas-grid">
                <div class="tarea-card">
                    <h3>Actualizar precios de productos</h3>
                    <p>Revisar los artículos con precios desactualizados y ajustar según el nuevo catálogo.</p>
                    <span class="badge badge-pendiente">Pendiente</span>
                </div>

                <div class="tarea-card">
                    <h3>Revisar solicitudes de empleados</h3>
                    <p>Verificar solicitudes pendientes y aprobar los cambios de rol en el sistema.</p>
                    <span class="badge badge-progreso">En progreso</span>
                </div>

                <div class="tarea-card">
                    <h3>Verificar inventario del almacén</h3>
                    <p>Confirmar los productos con bajo stock y notificar a proveedores.</p>
                    <span class="badge badge-pendiente">Pendiente</span>
                </div>

                <div class="tarea-card">
                    <h3>Actualizar base de datos de clientes</h3>
                    <p>Depurar datos duplicados y corregir información de contacto.</p>
                    <span class="badge badge-completada">Completada</span>
                </div>

                <div class="tarea-card">
                    <h3>Optimizar rendimiento del sistema</h3>
                    <p>Analizar consultas SQL lentas y mejorar tiempos de carga.</p>
                    <span class="badge badge-progreso">En progreso</span>
                </div>
            </div>
        </div>
    </body>
</html>