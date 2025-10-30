<%-- 
    Document   : soporte.jsp
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

    String nombre = (String) sesion.getAttribute("nombre");
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Soporte - Tienda K</title>
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

            .btn-secondary {
                background: #e2e8f0;
                color: #4a5568;
            }

            .btn-secondary:hover {
                background: #cbd5e0;
            }

            .section {
                margin-bottom: 40px;
            }

            .section h2 {
                color: #2d3748;
                margin-bottom: 15px;
                font-size: 1.5em;
                border-left: 5px solid #667eea;
                padding-left: 10px;
            }

            .formulario {
                background: #f8fafc;
                border-radius: 15px;
                padding: 25px;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            }

            .form-group {
                margin-bottom: 15px;
            }

            .form-group label {
                display: block;
                margin-bottom: 6px;
                font-weight: 600;
                color: #4a5568;
            }

            .form-group input, .form-group textarea {
                width: 100%;
                padding: 12px;
                border: 1px solid #cbd5e0;
                border-radius: 10px;
                font-size: 0.95em;
                font-family: inherit;
            }

            .form-group textarea {
                resize: none;
                height: 100px;
            }

            .btn-enviar {
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                color: white;
                border: none;
                border-radius: 25px;
                padding: 12px 25px;
                font-weight: 600;
                cursor: pointer;
                transition: all 0.3s ease;
            }

            .btn-enviar:hover {
                transform: translateY(-2px);
                box-shadow: 0 10px 25px rgba(102, 126, 234, 0.4);
            }

            .faq {
                background: #f8fafc;
                border-radius: 15px;
                padding: 25px;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            }

            .faq-item {
                margin-bottom: 15px;
            }

            .faq-item h4 {
                color: #2d3748;
                margin-bottom: 5px;
            }

            .faq-item p {
                color: #4a5568;
                font-size: 0.95em;
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
                    <h1>Soporte al Cliente</h1>
                    <span>Hola, <strong><%= nombre%></strong>. ¿En qué podemos ayudarte hoy?</span>
                </div>
                <a href="miPerfil.jsp" class="btn btn-secondary">⬅ Volver al perfil</a>
            </div>

            <!-- Sección de contacto -->
            <div class="section">
                <h2>📩 Contáctanos</h2>
                <div class="formulario">
                    <div class="form-group">
                        <label>Asunto</label>
                        <input type="text" placeholder="Ej. Problema con mi pedido">
                    </div>

                    <div class="form-group">
                        <label>Mensaje</label>
                        <textarea placeholder="Describe brevemente tu solicitud o inconveniente..."></textarea>
                    </div>

                    <button class="btn-enviar">Enviar mensaje</button>
                </div>
            </div>

            <!-- Sección de preguntas frecuentes -->
            <div class="section">
                <h2>❓ Preguntas Frecuentes</h2>
                <div class="faq">
                    <div class="faq-item">
                        <h4>¿Cuánto tarda en llegar mi pedido?</h4>
                        <p>Normalmente entre 2 y 5 días hábiles dependiendo de tu ubicación.</p>
                    </div>
                    <div class="faq-item">
                        <h4>¿Puedo cambiar o cancelar un pedido?</h4>
                        <p>Sí, siempre y cuando el pedido no haya sido enviado. Puedes hacerlo desde la sección “Mis pedidos”.</p>
                    </div>
                    <div class="faq-item">
                        <h4>¿Qué métodos de pago aceptan?</h4>
                        <p>Aceptamos pagos con tarjeta, Nequi, Daviplata y contra entrega.</p>
                    </div>
                    <div class="faq-item">
                        <h4>¿Dónde puedo recoger mi pedido?</h4>
                        <p>En la sede principal de la Fundación Universitaria Konrad Lorenz o solicitar envío a domicilio.</p>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>