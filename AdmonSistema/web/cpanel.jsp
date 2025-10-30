<%-- 
    Document   : cpanel
    Created on : 23/10/2025, 6:57:22 p. m.
    Author     : camiloprieto
--%>

<%@ page import="co.edu.konradlorenz.modelo.Conexion" %>
<%@ page import="co.edu.konradlorenz.modelo.Usuario" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<%
    // Recuperar la sesión
    HttpSession sesion_cli = request.getSession(false);
    
    // Verificar si hay sesión activa
    if (sesion_cli == null || sesion_cli.getAttribute("usuario") == null) {
        response.sendRedirect("index.jsp");
        return;
    }
    
    // Obtener datos del usuario desde la sesión
    Usuario datosUsuario = (Usuario) sesion_cli.getAttribute("datosCompletos");
    String nombre = (String) sesion_cli.getAttribute("nombre");
    String apellido = (String) sesion_cli.getAttribute("apellido");
    String usuario = (String) sesion_cli.getAttribute("usuario");
    Integer perfil = (Integer) sesion_cli.getAttribute("perfil");
    
    // Determinar el nombre y color del perfil
    String nombrePerfil = "";
    String colorPerfil = "#667eea";
    String iconoPerfil = "👤";
    
    switch(perfil) {
        case 1:
            nombrePerfil = "Administrador";
            colorPerfil = "#f093fb";
            iconoPerfil = "👑";
            break;
        case 2:
            nombrePerfil = "Empleado";
            colorPerfil = "#4facfe";
            iconoPerfil = "💼";
            break;
        case 3:
            nombrePerfil = "Cliente";
            colorPerfil = "#43e97b";
            iconoPerfil = "👤";
            break;
        default:
            nombrePerfil = "Usuario";
    }
    
    // Obtener las actividades del usuario
    Connection con = null;
    Statement sentencia = null;
    ResultSet resultado = null;
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - <%= nombrePerfil %></title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f5f7fa;
            height: 100vh;
            overflow: hidden;
        }
        
        /* Header */
        .header {
            background: linear-gradient(135deg, <%= colorPerfil %> 0%, #764ba2 100%);
            color: white;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            position: relative;
            z-index: 100;
        }
        
        .header-left {
            display: flex;
            align-items: center;
            gap: 20px;
        }
        
        .logo {
            font-size: 1.5em;
            font-weight: 700;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .header-right {
            display: flex;
            align-items: center;
            gap: 20px;
        }
        
        .user-info {
            text-align: right;
        }
        
        .user-name {
            font-weight: 600;
            font-size: 1.1em;
        }
        
        .user-role {
            font-size: 0.9em;
            opacity: 0.9;
        }
        
        .btn-logout {
            background: rgba(255, 255, 255, 0.2);
            color: white;
            border: 2px solid white;
            padding: 8px 20px;
            border-radius: 20px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 5px;
        }
        
        .btn-logout:hover {
            background: white;
            color: <%= colorPerfil %>;
            transform: scale(1.05);
        }
        
        /* Layout principal */
        .main-container {
            display: flex;
            height: calc(100vh - 70px);
        }
        
        /* Sidebar */
        .sidebar {
            width: 280px;
            background: white;
            box-shadow: 2px 0 10px rgba(0, 0, 0, 0.1);
            overflow-y: auto;
            transition: all 0.3s ease;
        }
        
        .menu-header {
            background: linear-gradient(135deg, <%= colorPerfil %> 0%, #764ba2 100%);
            color: white;
            padding: 20px;
            font-size: 1.3em;
            font-weight: 600;
            text-align: center;
        }
        
        .menu-list {
            list-style: none;
            padding: 0;
        }
        
        .menu-item {
            border-bottom: 1px solid #e2e8f0;
        }
        
        .menu-link {
            display: block;
            padding: 15px 20px;
            color: #2d3748;
            text-decoration: none;
            transition: all 0.3s ease;
            font-weight: 500;
            position: relative;
        }
        
        .menu-link:hover {
            background: linear-gradient(90deg, <%= colorPerfil %>15 0%, transparent 100%);
            border-left: 4px solid <%= colorPerfil %>;
            padding-left: 16px;
        }
        
        .menu-link::before {
            content: '▸';
            margin-right: 10px;
            color: <%= colorPerfil %>;
            font-weight: bold;
        }
        
        /* Área de contenido */
        .content-area {
            flex: 1;
            background: #f5f7fa;
            overflow: hidden;
            position: relative;
        }
        
        .content-iframe {
            width: 100%;
            height: 100%;
            border: none;
            background: white;
        }
        
        /* Mensaje cuando no hay menú */
        .no-menu {
            padding: 20px;
            text-align: center;
            color: #718096;
            font-style: italic;
        }
        
        /* Responsive */
        @media (max-width: 768px) {
            .sidebar {
                width: 100%;
                max-width: 250px;
                position: absolute;
                left: -100%;
                z-index: 50;
                height: 100%;
            }
            
            .sidebar.active {
                left: 0;
            }
            
            .header-left {
                gap: 10px;
            }
            
            .logo {
                font-size: 1.2em;
            }
            
            .user-info {
                display: none;
            }
        }
        
        /* Scrollbar personalizado */
        .sidebar::-webkit-scrollbar {
            width: 6px;
        }
        
        .sidebar::-webkit-scrollbar-track {
            background: #f1f1f1;
        }
        
        .sidebar::-webkit-scrollbar-thumb {
            background: <%= colorPerfil %>;
            border-radius: 3px;
        }
        
        .sidebar::-webkit-scrollbar-thumb:hover {
            background: #764ba2;
        }
        
        /* Loading animation */
        .loading {
            display: none;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            font-size: 2em;
            color: <%= colorPerfil %>;
        }
        
        @keyframes spin {
            to { transform: translate(-50%, -50%) rotate(360deg); }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <div class="header">
        <div class="header-left">
            <div class="logo">
                <span><%= iconoPerfil %></span>
                <span>Sistema de Gestión</span>
            </div>
        </div>
        <div class="header-right">
            <div class="user-info">
                <div class="user-name"><%= nombre %> <%= apellido %></div>
                <div class="user-role"><%= nombrePerfil %></div>
            </div>
            <a href="cerrarSesion" class="btn-logout">
                <span>🚪</span>
                <span>Cerrar Sesión</span>
            </a>
        </div>
    </div>
    
    <!-- Container principal -->
    <div class="main-container">
        <!-- Sidebar con menú -->
        <aside class="sidebar">
            <div class="menu-header">
                📋 Menú Principal
            </div>
            <ul class="menu-list">
                <%
                    try {
                        Conexion cn = new Conexion();
                        con = cn.crearConexion();
                        sentencia = con.createStatement();
                        resultado = sentencia.executeQuery(
                            "SELECT actividades.nom_actividad AS actividad, " +
                            "actividades.id_actividad AS idAct, " +
                            "actividades.enlace AS enlace " +
                            "FROM usuario, actividades, gesActividad, perfiles " +
                            "WHERE gesActividad.id_actividad = actividades.id_actividad " +
                            "AND gesActividad.id_perfil = perfiles.idperfiles " +
                            "AND usuario.id_perfil = perfiles.idperfiles " +
                            "AND usuario.usuario = '" + usuario + "' " +
                            "ORDER BY actividades.id_actividad"
                        );
                        
                        boolean tieneActividades = false;
                        while (resultado.next()) {
                            tieneActividades = true;
                %>
                <li class="menu-item">
                    <a href="<%= resultado.getString("enlace") %>?id=<%= resultado.getInt("idAct") %>" 
                       class="menu-link" 
                       target="contenido">
                        <%= resultado.getString("actividad") %>
                    </a>
                </li>
                <%
                        }
                        
                        if (!tieneActividades) {
                %>
                <li class="no-menu">
                    No hay actividades asignadas a tu perfil.
                </li>
                <%
                        }
                        
                    } catch (SQLException e) {
                        out.println("<li class='no-menu'>Error al cargar el menú: " + e.getMessage() + "</li>");
                    } finally {
                        try {
                            if (resultado != null) resultado.close();
                            if (sentencia != null) sentencia.close();
                            if (con != null) con.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                %>
            </ul>
        </aside>
        
        <!-- Área de contenido -->
        <main class="content-area">
            <div class="loading">⏳ Cargando...</div>
            <iframe name="contenido" class="content-iframe" src="front.jsp"></iframe>
        </main>
    </div>
    
    <script>
        // Mostrar loading cuando se carga una página
        const iframe = document.querySelector('.content-iframe');
        const loading = document.querySelector('.loading');
        
        iframe.addEventListener('load', function() {
            loading.style.display = 'none';
        });
        
        // Opcional: Agregar funcionalidad de menú móvil
        const menuLinks = document.querySelectorAll('.menu-link');
        menuLinks.forEach(link => {
            link.addEventListener('click', function() {
                loading.style.display = 'block';
            });
        });
    </script>
</body>
</html>