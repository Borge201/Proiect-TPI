<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,java.sql.*, java.io.*, java.util.*,sala.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User home</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="sala.Sala"/>
    <jsp:setProperty name="jb" property="*"/>
    <body>
        <%
        String Email=request.getParameter("Email");
        String PassW =request.getParameter("PassW");
        if (Email!=null && PassW!=null){
        jb.connect();
        jb.logInUser(Email,PassW);
        %>
        	<p><%= jb.getClientMail()%> E-Mailul dumneavoastra</p>
            <p><%= jb.getClientID()%> Va este ID-ul de client</p>
        <%
        }
        else{
        %>
        <p>Login esuat parola sau emailul sunt gresite</p>
        <a href="usr_login.jsp">Inapoi la login</a>
        <%
        
        }
        jb.disconnect();
        %>
        
        
        
        <h2><a href="index.html" >Inapoi la pagina principala</a></h2>
    </body>
</html>

