<%-- 
    Document   : consultas
    Created on : 2/05/2021, 10:38:00 PM
    Author     : PC
--%>
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
            ResultSet res = null;
            int sumadisp = 0; 
            
            try {
                Class.forName("com.mysql.jdbc.Driver");
                c = DriverManager.getConnection("jdbc:mysql://localhost/Teciliztli?autoReconnect=true&useSSL=false","root","Fernandoipn9");
                sta = c.createStatement();
            }catch(Exception ex) {
                out.print(ex.toString());
            }
            
            try {
                String usuario = request.getParameter("usuario");
                res = sta.executeQuery("select * from reservacion where usuario='"+usuario+"';");
                  if (res.next()) {
                    String user = res.getString("usuario");
                    String nom = res.getString("nombre");
                    String tel = res.getString("telefono");
                    String mail = res.getString("correoelec");
                    String hotel = res.getString("hotel");
                    String thabit = res.getString("tipohab");
//                    String disp = res.getString("disponibilidad");
//                    int  disp = Integer.ParseInt("disponibilidad");
             } 
                    else {
                    out.println("<script>alert('Aquí estan los registros')</script>");
                }
            } catch(Exception error) {
                out.println(error.toString());
            }
                res = sta.executeQuery("select * from datos;");
                out.println("<table border='1'>");
                    out.println("<thead>");
                    out.println("<td>" + "usuario" + "</td>");
                    out.println("<td>" + "nombre" + "</td>");
                    out.println("<td>" + "telefono" + "</td>");
                    out.println("<td>" + "correo electronico" + "</td>");
                    out.println("<td>" + "hotel" + "</td>");
                    out.println("<td>" + "tipo de habitación" + "</td>");    
                    out.println("</thead>");
                    
                while (res.next()) {
                    String user = res.getString("usuario");
                    String nom = res.getNString("nombre");
                    String tel = res.getNString("Telefono");
                    String mail = res.getNString("Correoelec");
                    String hotel = res.getNString("Hotel");
                    String thabit = res.getNString("tipohab");
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