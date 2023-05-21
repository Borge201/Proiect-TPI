<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,java.sql.*, java.io.*, java.util.*,sala.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User log in</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="sala.Sala"/>
    <jsp:setProperty name="jb" property="*"/>
    <body>
         <body>
        <h1> Va rugam sa folositi un e-mail si o parola.</h1>
        <form action="usr_home_base.jsp" method="get">
            <table>
                <tr>
                    <td align="Right">E-mail:</td>
                    <td><input type="text" name="Email" required /></td>
                </tr>
                <tr>
                    <td align="Right">Parola:</td>
                    <td><input type="password" name="PassW" required /></td>
                </tr>
  
            </table>
            <button type="submit">Log in</button>
            
        </form>
        <h2><a href="index.html" >Inapoi la pagina principala</a></h2>
    </body>
</html>


