<%-- 
    merge
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,sala.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Clienti</title>
        <link rel="stylesheet" href="base.css">
    </head>
    <jsp:useBean id="jb" scope="session" class="sala.Sala" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <%
        jb.connect();
            String[] s = request.getParameterValues("primarykey");
            jb.connect();
            jb.stergeDateTabela(s, "Clienti", "idClienti");
            jb.disconnect();
        %>
       <p align="center">
            <a href="admn_home_base.html"><b>Home</b></a>
            <a href="Utilizatori.jsp"><b><strong>Inapoi la tabela CLienti</strong></b></a>
            <br/>
        </p>
    </body>
</html>