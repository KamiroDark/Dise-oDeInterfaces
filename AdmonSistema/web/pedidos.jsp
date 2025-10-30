<%-- 
    Document   : pedidos.jsp
    Created on : 30/10/2025
    Author     : camiloprieto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Verificar sesión activa
    HttpSession sesion = request.getSession(false);
    if (sesion == null || sesion.getAttribute("usuario") == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    String nombre = (String) sesion.getAttribute("nombre");
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Mis Pedidos - Tienda K</title>
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
                max-width: 1100px;
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

            .header span {
                font-size: 1em;
                color: #718096;
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

            .pedido-card {
                background: white;
                border-radius: 15px;
                padding: 20px;
                box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
                margin-bottom: 20px;
                transition: all 0.3s ease;
                border-left: 6px solid #667eea;
            }

            .pedido-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 12px 30px rgba(0, 0, 0, 0.15);
            }

            .pedido-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 10px;
            }

            .pedido-header h3 {
                color: #2d3748;
                font-size: 1.3em;
            }

            .pedido-info {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
                gap: 10px;
                margin-bottom: 15px;
                color: #4a5568;
            }

            .badge {
                display: inline-block;
                padding: 6px 12px;
                border-radius: 15px;
                font-size: 0.8em;
                font-weight: 600;
            }

            .badge-enviado {
                background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
                color: white;
            }

            .badge-entregado {
                background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%);
                color: white;
            }

            .badge-pendiente {
                background: linear-gradient(135deg, #fa709a 0%, #fee140 100%);
                color: #2d3748;
            }

            .productos {
                margin-top: 10px;
                font-size: 0.9em;
                color: #718096;
            }

            .productos ul {
                margin-left: 15px;
            }

            @media (max-width: 768px) {
                .header {
                    flex-direction: column;
                    gap: 15px;
                    text-align: center;
                }
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="header">
                <div>
                    <h1>Mis Pedidos</h1>
                    <span>Bienvenido, <strong><%= nombre%></strong></span>
                </div>
                <a href="miPerfil.jsp" class="btn btn-secondary">👤 Mi Perfil</a>
            </div>

            <!-- Pedido 1 -->
            <div class="pedido-card">
                <div class="pedido-header">
                    <h3>Pedido #1024</h3>
                    <span class="badge badge-pendiente">Pendiente de envío</span>
                </div>
                <div class="pedido-info">
                    <p><strong>Fecha:</strong> 28 Oct 2025</p>
                    <p><strong>Método de pago:</strong> Tarjeta de crédito</p>
                    <p><strong>Total:</strong> $185.000 COP</p>
                </div>
                <div class="productos">
                    <strong>Productos:</strong>
                    <ul>
                        <li>Cuaderno rayado x100 hojas</li>
                        <li>Bolígrafo azul</li>
                        <li>Resaltador amarillo</li>
                    </ul>
                </div>
            </div>

            <!-- Pedido 2 -->
            <div class="pedido-card">
                <div class="pedido-header">
                    <h3>Pedido #1018</h3>
                    <span class="badge badge-enviado">Enviado</span>
                </div>
                <div class="pedido-info">
                    <p><strong>Fecha:</strong> 24 Oct 2025</p>
                    <p><strong>Método de pago:</strong> Nequi</p>
                    <p><strong>Total:</strong> $92.000 COP</p>
                </div>
                <div class="productos">
                    <strong>Productos:</strong>
                    <ul>
                        <li>Calculadora científica</li>
                        <li>Juego de reglas</li>
                    </ul>
                </div>
            </div>

            <!-- Pedido 3 -->
            <div class="pedido-card">
                <div class="pedido-header">
                    <h3>Pedido #1005</h3>
                    <span class="badge badge-entregado">Entregado</span>
                </div>
                <div class="pedido-info">
                    <p><strong>Fecha:</strong> 18 Oct 2025</p>
                    <p><strong>Método de pago:</strong> Efectivo (contra entrega)</p>
                    <p><strong>Total:</strong> $120.000 COP</p>
                </div>
                <div class="productos">
                    <strong>Productos:</strong>
                    <ul>
                        <li>Carpeta oficio</li>
                        <li>Block de notas</li>
                        <li>Lápiz HB x12</li>
                    </ul>
                </div>
            </div>
        </div>
    </body>
</html>