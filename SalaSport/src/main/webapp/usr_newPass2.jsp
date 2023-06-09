<%-- 
    Document   : usr_sigup
    Created on : 03-May-2023, 13:25:08
    Author     : George
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,java.sql.*, java.io.*, java.util.*,sala.*"%>
<!DOCTYPE html>

<html>
   <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User sign up</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="sala.Sala"/>
    <jsp:setProperty name="jb" property="*"/>
    <body>
        <%
        String Email= jb.getClientMail();
        String PassW="";
        String buffer="";
        ResultSet rs;
        jb.connect();
        PassW =request.getParameter("PassW");
      buffer =request.getParameter("buffer");
        rs=jb.checkUser(Email);
        if (PassW.equals(buffer))
        {
        rs.next();
        if(rs.getInt("exista")!=1){       	
        %>
        
        <script>
        (function emailNefolosit(){
        	alert("Email-ul nu exista.")
        })();
        </script>
        
       <% 
        }
        else{
        jb.forgotUserPass(Email,PassW);
        jb.disconnect();
        %>
        <script>
        (function goToUserHome(){
        	location.replace("usr_login.jsp")
        })();
        </script>
        <%
        }
        }
       
        %>
    </body>
</html>