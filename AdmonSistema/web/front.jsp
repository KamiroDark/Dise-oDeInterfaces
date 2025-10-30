<%-- 
    Document   : front
    Created on : 30/10/2025, 2:29:18 p. m.
    Author     : camiloprieto
--%>

<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    // Recuperar datos de la sesión
    HttpSession sesion = request.getSession(false);
    String nombre = (sesion != null) ? (String) sesion.getAttribute("nombre") : "Usuario";
    String apellido = (sesion != null) ? (String) sesion.getAttribute("apellido") : "";
    Integer perfil = (sesion != null) ? (Integer) sesion.getAttribute("perfil") : 0;
    
    String nombrePerfil = "";
    String colorPerfil = "#667eea";
    
    switch(perfil) {
        case 1:
            nombrePerfil = "Administrador";
            colorPerfil = "#f093fb";
            break;
        case 2:
            nombrePerfil = "Empleado";
            colorPerfil = "#4facfe";
            break;
        case 3:
            nombrePerfil = "Cliente";
            colorPerfil = "#43e97b";
            break;
        default:
            nombrePerfil = "Usuario";
    }
    
    // Obtener hora del día para el saludo
    java.util.Calendar cal = java.util.Calendar.getInstance();
    int hora = cal.get(java.util.Calendar.HOUR_OF_DAY);
    String saludo = "";
    String emoji = "";
    
    if (hora >= 6 && hora < 12) {
        saludo = "Buenos días";
        emoji = "☀️";
    } else if (hora >= 12 && hora < 19) {
        saludo = "Buenas tardes";
        emoji = "🌤️";
    } else {
        saludo = "Buenas noches";
        emoji = "🌙";
    }
    
    // Fecha actual
    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("EEEE, d 'de' MMMM 'de' yyyy", new java.util.Locale("es", "ES"));
    String fechaActual = sdf.format(new java.util.Date());
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Bienvenida</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, <%=colorPerfil%> 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            overflow: hidden;
            position: relative;
        }
        
        /* Animación de fondo */
        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: 
                radial-gradient(circle at 20% 50%, rgba(255, 255, 255, 0.1) 0%, transparent 50%),
                radial-gradient(circle at 80% 80%, rgba(255, 255, 255, 0.1) 0%, transparent 50%);
            animation: pulse 15s ease-in-out infinite;
        }
        
        @keyframes pulse {
            0%, 100% { opacity: 0.5; }
            50% { opacity: 1; }
        }
        
        .container {
            position: relative;
            z-index: 1;
            background: rgba(255, 255, 255, 0.95);
            padding: 60px 50px;
            border-radius: 30px;
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.2);
            text-align: center;
            max-width: 700px;
            width: 100%;
            animation: fadeInUp 0.8s ease-out;
            backdrop-filter: blur(10px);
        }
        
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        .emoji {
            font-size: 80px;
            animation: bounce 2s ease-in-out infinite;
            display: inline-block;
            margin-bottom: 20px;
        }
        
        @keyframes bounce {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-20px); }
        }
        
        h1 {
            font-size: 2.5em;
            color: #2d3748;
            margin-bottom: 10px;
            font-weight: 700;
        }
        
        .greeting {
            font-size: 1.8em;
            color: #4a5568;
            margin-bottom: 30px;
            font-weight: 300;
        }
        
        .user-info {
            background: linear-gradient(135deg, <%=colorPerfil%>, #764ba2);
            color: white;
            padding: 25px;
            border-radius: 20px;
            margin: 30px 0;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }
        
        .user-name {
            font-size: 2em;
            font-weight: 600;
            margin-bottom: 10px;
        }
        
        .user-role {
            display: inline-block;
            background: rgba(255, 255, 255, 0.3);
            padding: 8px 20px;
            border-radius: 25px;
            font-size: 1.1em;
            font-weight: 500;
            margin-top: 10px;
            backdrop-filter: blur(10px);
        }
        
        .date-info {
            color: #718096;
            font-size: 1.1em;
            margin: 20px 0;
            font-weight: 400;
        }
        
        .stats {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: 20px;
            margin-top: 30px;
        }
        
        .stat-card {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            padding: 25px;
            border-radius: 15px;
            color: white;
            transition: all 0.3s ease;
            cursor: pointer;
        }
        
        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
        }
        
        .stat-icon {
            font-size: 2.5em;
            margin-bottom: 10px;
        }
        
        .stat-title {
            font-size: 0.9em;
            opacity: 0.9;
            margin-bottom: 5px;
        }
        
        .stat-value {
            font-size: 1.8em;
            font-weight: 700;
        }
        
        .welcome-message {
            background: #f7fafc;
            padding: 25px;
            border-radius: 15px;
            margin-top: 30px;
            border-left: 5px solid <%=colorPerfil%>;
        }
        
        .welcome-message p {
            color: #4a5568;
            font-size: 1.1em;
            line-height: 1.6;
        }
        
        .action-buttons {
            display: flex;
            gap: 15px;
            justify-content: center;
            margin-top: 30px;
            flex-wrap: wrap;
        }
        
        .btn {
            padding: 12px 30px;
            border: none;
            border-radius: 25px;
            font-size: 1em;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
        }
        
        .btn-primary {
            background: linear-gradient(135deg, <%=colorPerfil%>, #764ba2);
            color: white;
        }
        
        .btn-primary:hover {
            transform: scale(1.05);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
        }
        
        .clock {
            font-size: 3em;
            font-weight: 700;
            color: <%=colorPerfil%>;
            margin: 20px 0;
            font-variant-numeric: tabular-nums;
        }
        
        @media (max-width: 600px) {
            .container {
                padding: 40px 25px;
            }
            
            h1 {
                font-size: 2em;
            }
            
            .greeting {
                font-size: 1.3em;
            }
            
            .user-name {
                font-size: 1.5em;
            }
            
            .stats {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="emoji"><%=emoji%></div>
        <h1><%=saludo%></h1>
        <div class="greeting">¡Bienvenid@ al sistema!</div>
        
        <div class="user-info">
            <div class="user-name"><%=nombre%> <%=apellido%></div>
            <div class="user-role">🏆 <%=nombrePerfil%></div>
        </div>
        
        <div class="clock" id="reloj"></div>
        
        <div class="date-info">
            📅 <%=fechaActual%>
        </div>
        
        <div class="stats">
            <div class="stat-card" style="background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);">
                <div class="stat-icon">📊</div>
                <div class="stat-title">Sesión activa</div>
                <div class="stat-value">✓</div>
            </div>
            
            <div class="stat-card" style="background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);">
                <div class="stat-icon">🔐</div>
                <div class="stat-title">Acceso</div>
                <div class="stat-value"><%=nombrePerfil%></div>
            </div>
            
            <div class="stat-card" style="background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%);">
                <div class="stat-icon">⚡</div>
                <div class="stat-title">Estado</div>
                <div class="stat-value">Activo</div>
            </div>
        </div>
        
        <div class="welcome-message">
            <p>
                <strong>👈 Utiliza el menú lateral</strong> para navegar por las diferentes secciones 
                disponibles según tu rol de <strong><%=nombrePerfil%></strong>.
            </p>
        </div>
        
        <div class="action-buttons">
            <button class="btn btn-primary" onclick="parent.location.reload()">
                🔄 Actualizar Dashboard
            </button>
        </div>
    </div>
    
    <script>
        // Reloj en tiempo real
        function actualizarReloj() {
            const ahora = new Date();
            const horas = String(ahora.getHours()).padStart(2, '0');
            const minutos = String(ahora.getMinutes()).padStart(2, '0');
            const segundos = String(ahora.getSeconds()).padStart(2, '0');
            
            document.getElementById('reloj').textContent = horas + ':' + minutos + ':' + segundos;
        }
        
        // Actualizar cada segundo
        setInterval(actualizarReloj, 1000);
        actualizarReloj(); // Llamada inicial
    </script>
</body>
</html>