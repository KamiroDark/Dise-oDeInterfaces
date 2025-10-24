<%-- 
    Document   : cpanel
    Created on : 23/10/2025, 6:57:22 p. m.
    Author     : camiloprieto
--%>

<%@page import="co.edu.konradlorenz.modelo.Conexion"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import= "modelo.Conexion" %>
<%
//recuperar la sesión
    HttpSession sesion_cli = request.getSession(true);
    String nUsuario = (String) sesion_cli.getAttribute("nUsuario");
    Connection con = null;
    Statement sentencia = null;
    ResultSet resultado = null;
    String nombre = null;
    String apellido = null;
    String usu = null;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Login</title>
    </head>
    <body>
        <%
            try {
                Conexion cn = new Conexion();
                con = cn.crearConexion();
                sentencia = con.createStatement();
                resultado = sentencia.executeQuery("SELECT * from usuarios WHERE usuario ='" + nUsuario + "' ");
                while (resultado.next()) {
                    nombre = resultado.getString("nombre");
                    apellido = resultado.getString("apellido");
                    usu = resultado.getString("usuario");
                }
            } catch (Exception e) {
            }
            con.close();
        %>
        <!-- Consulta que permite seleccionar La información de las actividades asignadas -->
        <%
            if (usu.equals(nUsuario)) {
                Conexion cn1 = new Conexion();
                con = cn1.crearConexion();
                sentencia = con.createStatement();
                resultado = sentencia.executeQuery(
                        "SELECT actividades.nom_actividad AS actividad,actividades.id_actividad AS idAct, "
                        + "actividades.enlace AS enlace "
                        + "FROM usuarios, actividades, gesactividad, perfiles "
                        + "WHERE "
                        + "gesactividad.id_actividad = actividades.id_actividad AND "
                        + "gesactividad.id_perfil = perfiles.id_perfil AND "
                        + "usuarios.id_perfil = perfiles.id_perfil AND "
                        + "usuarios.usuario ='" + nUsuario + "' "
                );
        %>
        <div id="apDiv1">
            <table width="1191" height="667" border="1">
                <tr>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
        <div id="apDiv2">
            <table width="1184" height="159" border="1">
                <tr>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
        <div id="apDiv3">
            <table width="303" height="503" border="1">
                <tr>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>

        <div id="apDiv4">
            <table width="876" height="498" border="1">
                <tr>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
        <div id="apDiv5">
            <table width="244" border="1">
                <tr>
                    <th><strong>Menú</strong></th>
                </tr>
                <%
                    while (resultado.next()) {
                %>
                <tr>
                    <td><a href="<%=resultado.getString("enlace")%>?id=<%=resultado.getInt("idAct")%>"
                           target="marco"> <%=resultado.getString("actividad")%></a></td>
                </tr>
                <%}%>
                <%}%>
            </table>
        </div>
        <div id="apDiv6">&nbsp;
            <table width="657" border="1">
                <tr>
                    <td width="473"><%=nombre%>&nbsp;<%=apellido%></td>
                    <td width="168"><a href="cerrarSesion">Cerrar sesión</a></td>
                </tr>
            </table>
        </div>
        <div id="apDiv7">
            <iframe width="869" height="493" name="marco" src="front.jsp" frameborder="0"></iframe>
        </div>
    </body>
</html>