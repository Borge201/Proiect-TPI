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
        
        <h1> Va rugam sa folositi un e-mail si o parola.</h1>
        <form action="usr_newPass2.jsp" method="post">
            <table>
                <tr>
                    <td align="Right">Parola noua:</td>
                    <td><input type="password" name="PassW" requierd /></td>
                </tr>
                <tr>
                    <td align="Right">Confirmati Parola noua:</td>
                    <td><input type="password" name="buffer" requierd /></td>
                </tr>
                
                
            </table>
            <button type="submit">Resetati Parola</button>
            
        </form>
        <h2><a href="usr_base.jsp" >Inapoi la pagina principala</a></h2>
    </body>
</html>