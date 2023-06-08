<%@ page language="java" import="java.lang.*,java.math.*,java.sql.*, java.io.*, java.util.*,sala.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test cumparare abonament</title>
</head>
<jsp:useBean id="jb" scope="session" class="sala.Sala"/>
    <jsp:setProperty name="jb" property="*"/>
<body>
<%
int IdClient=jb.getClientID();
String Antrenor=request.getParameter("Antrenori");
int intrari=java.lang.Integer.parseInt(request.getParameter("Intrari"));
int zile=java.lang.Integer.parseInt(request.getParameter("Zile"));
if(IdClient!=0){
	jb.connect();
    jb.cuparaAbonamentUtilizatorNou(IdClient, zile, intrari, Antrenor);
}
jb.disconnect();
// ok asta merge pana cand fac loginul sa mearga poate nu o sa mai folosim workaroundul ala
%>
<p>Ati cumparat un abonament nou</p>
</body>
</html>