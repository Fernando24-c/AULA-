<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%> 
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/png" href="../imagenes/logoFaase (2).png">
        <title>Reservacion</title>
        <style>
        body{
                background: lightslategray;
                color: #3c4f75;
            }
            header{
                position: relative;
                /* El valor que se le da a position es relativo */
                margin: 20px auto;
                /* Con margin auto, la caja/contenedor se posiciona al centro del documento */
                /* margin: 0 0 ; Superior, lateral */
                width: 1000px;
                min-height: 120px;
                background: #3c4f75;
                color: whitesmoke;
                text-align: center;
                padding: 10px;
                font-size: 20px;
            }
            .regreso{
                color: whitesmoke;
                font-size: 20px;  
            }
        </style>
    </head>
    <body>
        <header>
        <h1>Altas</h1>
        </header>
        <%
            //request es un objeto perteneciente a la clase HttpServletRequest
            //su utilidad es para acceder a los parametros y atributos, para así 
            //poder trabajar con elos en nuestra pagina.
            //para ello se utiliza request.getParameter("");
//            String nom = request.getParameter("nombre");
            String des = request.getParameter("destino");
            String hot = request.getParameter("nHotel");
            String nhab = request.getParameter("numHab");
            String thab = request.getParameter("tipo");
            String ini = request.getParameter("inicio");
            String fin = request.getParameter("fin");
            
            
            Connection conx = null;
            Statement sta = null;
            try{
                Class.forName("com.mysql.jdbc.Driver");
                //Lo primero que se debe de realizar para conectar a una base de datos
                //es cargar el dirver encargado de esta funcion 
                
                //para establecer la conexion, la clase DriverManagertiene el metodo
                //getConnection
                conx = DriverManager.getConnection("jdbc:mysql://localhost/Teciliztli?autoReconnect=true&useSSL=false","root","Fernandoipn9");
                //conx = DriverManager.getConnection("jdbc:mysql://localhost:3306/emps?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false");
                //para realizar una alta, creamos un Statement y lo llamamos AU MÉTODO su método
                //executeUpdate()con createStatement() que debemos componer nosotros 
                //la SQL completa en un String
               sta = conx.createStatement();
            }
            catch (SQLException error){
                out.print(error.toString());
            }
            try{
                sta.executeUpdate("insert into reservacion values('"+des+"','"+hot+"','"+nhab+"', '"+thab+"', '"+ini+"', '"+fin+"');");
                out.println("<script>alert('Tu reservacion está lista')</script>");
                conx.close();
                sta.close();
            }
            catch(SQLException error){
                out.println(error.toString());
            }            
        %>
        <h1 class="regreso">
            <a href="../Teciliztli.html"">Teciliztli</a>
        </h1>
    </body>
</html>
