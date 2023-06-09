

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,sala.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Abonamente</title>
        <link rel="stylesheet" href="base.css">
    </head>
    <jsp:useBean id="jb" scope="session" class="sala.Sala" />
    <jsp:setProperty name="jb" property="*" />
    <body>
    <header>
        <h1>Fitness Tracker</h1>
   
        <nav>
            <ul>
                <li ><a href="admn_home_base.jsp">Home</a></li>
                <li ><a href="Utilizatori.jsp">Utilizatori</a></li>
                <li class="active"><a href="Abonamente.jsp">Abonamente Utilizatori</a></li>
                <li><a href="usr_logout.jsp">Log out</a></li>
            </ul>
        </nav>
        </header>
        <br/>
        <p align="center"><a href="nou_Abonament.jsp"><b>Creeaza un nou abonament.</b></a>
        <form action="sterge_Abonament.jsp" method="post">
            <table border="1" align="center">
                <tr>
                    <td><b>Mark:</b></td>
                    <td><b>IdAbonament:</b></td>
                    <td><b>IdClient:</b></td>
                    <td><b>EMailClienti:</b></td>
                    <td><b>DataExpirare:</b></td>
                    <td><b>Numar Intrari:</b></td>
                    <td><b>Antrenor:</b></td>
                </tr>
                <%
                    jb.connect();
                    ResultSet rs = jb.vedeAbonamente();
                    long x;
                    while (rs.next()) {
                        x = rs.getInt("idAbonamente");
                %>
                <tr>
                    <td><input type="radio" name="primarykey" value="<%= x%>" /></td><td><%= x%></td>
                    <td><%= rs.getInt("idClient")%></td>
                    <td><%= rs.getString("emailClienti")%></td>
                    <td><%= rs.getDate("expDate")%></td>
                    <td><%= rs.getInt("intrare")%></td>
                    <td><%= rs.getString("Antrenor")%></td>
                
                    <%
                        }
                    %>
                </tr>
            </table><br/>
           <p align="center">
                <input type="submit" value="Sterge liniile marcate">
            </p>
        </form>
        <%
            rs.close();
            jb.disconnect();
        %>
        <br/>
        
    </body>
</html>
