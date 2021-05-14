<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultas</title>
        <style>
            *{
		font-family: 'Open Sans', sans-serif;
	}
	body{
		width: 100%;
                background: #34495e;
                
        }
        #main-container{
         margin: 150px auto;
         width: 600px;
        }
        table{
            background: #fff;
            text-align: left;
            width: 80%;
        }
        th, td{
            border: 1px solid black;
            padding: 5px;
        }
        
        thead{
        background-color: #2ecece;
        border-bottom: solid 5px #2ecece;
        color: white;
        }
        
        tr:nth-child(even){
            background-color: #ddd;
        }
        tr:hover{
            background-color: #2ecece;
        }
        </style>
    </head>
    <body>

        <%
            
            Connection c = null;
            Statement sta = null;
            ResultSet r = null;
            
            try {
                Class.forName("com.mysql.jdbc.Driver");
                c = DriverManager.getConnection("jdbc:mysql://localhost/Teciliztli?autoReconnect=true&useSSL=false","root","Fernandoipn9");
                sta = c.createStatement();
            }catch(Exception ex) {
                out.print(ex.toString());
            }
            try {
                r = sta.executeQuery("select * from reservacion;");
                while(r.next()){
                    String con = r.getString("destino");
                    String nom = r.getString("nombre_Hotel");
                    String est = r.getString("numhab");
                    String tip = r.getString("tipo");
                    String ini = r.getString("fecha_inicio");
                    String fin = r.getString("fecha_final");
                    out.println("<tr>");
                        
                    out.println("<tr>");
                    out.println("<td>"+con+"</td>");
                    out.println("<td>"+nom+"</td>");
                    out.println("<td>"+est+"</td>");
                    out.println("<td>"+tip+"</td>");
                    out.println("<td>"+ini+"</td>");
                    out.println("<td>"+fin+"</td>");
                    
                    
                    
                    
                    
//                    String des = request.getParameter("destino");
//            String hot = request.getParameter("nHotel");
//            String nhab = request.getParameter("numHab");
//            String thab = request.getParameter("tipo");
//            String ini = request.getParameter("inicio");
//            String fin = request.getParameter("fin");
                }
            }
            catch(SQLException error){
                out.print(error.toString());
            }
            



             r = sta.executeQuery("select * from datos;");
                out.println("<table border='1'>");
                    out.println("<thead>");
                    out.println("<td>" + "usuario" + "</td>");
                    out.println("<td>" + "nombre" + "</td>");
                    out.println("<td>" + "telefono" + "</td>");
                    out.println("<td>" + "correo electronico" + "</td>");
                    out.println("<td>" + "hotel" + "</td>");
                    out.println("<td>" + "tipo de habitación" + "</td>");    
                    out.println("</thead>");
                    
                while (r.next()) {
                    String con = r.getString("destino");
                    String nom = r.getString("nombre_Hotel");
                    String est = r.getString("numhab");
                    String tip = r.getString("tipo");
                    String ini = r.getString("fecha_inicio");
                    String fin = r.getString("fecha_final");
//                    int disp = res.ParseInt("disponibilidad");

                    
                  out.println("<tr>");
                        out.println("<td>" + user + "</td>");
                        out.println("<td>" + nom + "</td>");
                        out.println("<td>" + tel + "</td>");
                        out.println("<td>" + mail + "</td>");
                        out.println("<td>" + hotel + "</td>");
                        out.println("<td>" + thabit + "</td>");
                       
                  out.println("</tr>");
//                  sumadisp += disp;                  
                }  
                    out.println("<br>");
                    out.println("<br>");
                    out.println("<table border = '1'>");
                    out.println("<tr>");
                        out.println("<td>" + "Disponibilidad del hotel:" + "</td>");
//                        out.println("<td>" + sumadisp + "</td>");
                    out.println("<tr>");  
        %>  

    </body>
</html>
