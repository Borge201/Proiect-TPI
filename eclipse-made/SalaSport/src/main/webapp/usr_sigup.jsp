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
        String Email= request.getParameter("Email");
        String PassW =request.getParameter("PassW");
        String buffer=request.getParameter("buffer");
        ResultSet rs;
        if (Email!=null && PassW.equals(buffer))
        {jb.connect();
        rs=jb.checkUser(Email);
        rs.next();
        if(rs.getInt("exista")==1){
        	jb.disconnect();
        	
        %>
        
        <script>
        (function emailFolosit(){
        	alert("Email-ul este deja folosit, va rugam folositi alta adresa.")
        })();
        </script>
        
       <% 
       %>
       <script>
       (function goToUserHome(){
       	location.replace("usr_sigup.jsp")
       })();
       </script>
       <% 
        }
        else{
        jb.signInUser(Email,PassW);
        jb.disconnect();
        %>
        <p>Sign up succesfull</p>
        <a href="index.html">Inapoi la pagina principala</a>
        <%
        }
        }else {
        %>
        <h1> Va rugam sa folositi un e-mail si o parola.</h1>
        <form action="usr_sigup.jsp" method="post">
            <table>
                <tr>
                    <td align="Right">E-mail:</td>
                    <td><input type="text" name="Email" required /></td>
                </tr>
                <tr>
                    <td align="Right">Parola:</td>
                    <td><input type="password" name="PassW" requierd /></td>
                </tr>
                <tr>
                    <td align="Right">Parola:</td>
                    <td><input type="password" name="buffer" requierd /></td>
                </tr>
                
                
            </table>
            <button type="submit">Sign up</button>
            
        </form>
        <%
        }
        %>
        <h2><a href="index.html" >Inapoi la pagina principala</a></h2>
    </body>
</html>