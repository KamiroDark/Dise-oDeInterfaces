<%-- 
    Document   : pruebaConexion
    Created on : 2/10/2025, 4:28:57?p. m.
    Author     : camiloprieto
--%>

<%@page import="java.sql.*"%>
<%@page import="co.edu.konradlorenz.modelo.Conexion"%>

<html>
<head>
    <title>Prueba de Conexión</title>
</head>
<body>
    <h2>Resultado de la conexión</h2>
    <%
        Conexion cn = new Conexion();
        Connection con = cn.crearConexion();
        if(con != null){
            out.println("<p style='color:green;'>? Conectado a la base de datos correctamente.</p>");

            // Probar consulta
            try {
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM usuario LIMIT 1");

                if(rs.next()){
                    out.println("<p>Primer registro encontrado: " + rs.getString("nombre") + " " + rs.getString("apellido") + "</p>");
                } else {
                    out.println("<p>No hay datos en la tabla todavía.</p>");
                }

                con.close();
            } catch(Exception e){
                out.println("<p style='color:red;'>? Error ejecutando consulta: " + e.getMessage() + "</p>");
            }
        } else {
            out.println("<p style='color:red;'>? No se pudo conectar a la base de datos.</p>");
        }
    %>
</body>
</html>