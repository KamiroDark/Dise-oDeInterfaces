<%-- 
    Document   : configurarSistema
    Created on : 30/10/2025, 5:03:51 p. m.
    Author     : camiloprieto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion = request.getSession();
    if (sesion.getAttribute("usuario") == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    String nombre = (String) sesion.getAttribute("nombre");
    String apellido = (String) sesion.getAttribute("apellido");
    String perfil = String.valueOf(sesion.getAttribute("perfil"));
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Configuración del Sistema</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    </head>
    <body>
        <!-- NAVBAR -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Panel de Administración</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link" href="dashboardAdmin.jsp">Inicio</a></li>
                        <li class="nav-item"><a class="nav-link" href="miPerfil.jsp">Mi Perfil</a></li>
                        <li class="nav-item"><a class="nav-link active" href="configuracionSistema.jsp">Configuración</a></li>
                    </ul>
                    <span class="navbar-text text-white me-3">
                        <i class="fa-solid fa-user"></i> <%= nombre%> <%= apellido%> | <%= perfil%>
                    </span>
                    <a href="CerrarSesion" class="btn btn-outline-light btn-sm">Cerrar sesión</a>
                </div>
            </div>
        </nav>

        <!-- CONTENIDO PRINCIPAL -->
        <div class="container my-5">
            <h2 class="text-center mb-4"><i class="fa-solid fa-gear"></i> Configuración del Sistema</h2>
            <div class="row g-4">
                <div class="col-md-6 col-lg-4">
                    <div class="card shadow-sm border-0 h-100">
                        <div class="card-body text-center">
                            <i class="fa-solid fa-sliders-h fa-3x mb-3 text-primary"></i>
                            <h5 class="card-title">Parámetros Generales</h5>
                            <p class="card-text text-muted">Ajustes básicos del sistema, idioma, zona horaria y formato de fecha.</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-6 col-lg-4">
                    <div class="card shadow-sm border-0 h-100">
                        <div class="card-body text-center">
                            <i class="fa-solid fa-users-gear fa-3x mb-3 text-success"></i>
                            <h5 class="card-title">Roles y Permisos</h5>
                            <p class="card-text text-muted">Gestión visual de los permisos y accesos para los diferentes perfiles.</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-6 col-lg-4">
                    <div class="card shadow-sm border-0 h-100">
                        <div class="card-body text-center">
                            <i class="fa-solid fa-puzzle-piece fa-3x mb-3 text-warning"></i>
                            <h5 class="card-title">Integraciones</h5>
                            <p class="card-text text-muted">Configuración de integraciones externas y servicios del sistema.</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-6 col-lg-4">
                    <div class="card shadow-sm border-0 h-100">
                        <div class="card-body text-center">
                            <i class="fa-solid fa-database fa-3x mb-3 text-danger"></i>
                            <h5 class="card-title">Copias de Seguridad</h5>
                            <p class="card-text text-muted">Opciones para gestionar respaldos y restauración de datos.</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-6 col-lg-4">
                    <div class="card shadow-sm border-0 h-100">
                        <div class="card-body text-center">
                            <i class="fa-solid fa-brush fa-3x mb-3 text-info"></i>
                            <h5 class="card-title">Personalización</h5>
                            <p class="card-text text-muted">Colores, logotipos y ajustes de apariencia del sistema.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- FOOTER -->
        <footer class="bg-dark text-white text-center py-3 mt-5">
            <small>Panel Administrativo</small>
        </footer>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>