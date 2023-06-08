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
<p>Abonamentul Dumneavoastra</p>
<%
ResultSet rs,rs1;
String bufferstring1;
jb.connect();
rs1=jb.checkAbonament(jb.getClientID());
rs1.next();
if(rs1.getInt("exista")==1){
	rs=jb.veziAbonamentUtilizator(jb.getClientID());
	rs.next();
	%>
	<ul>
	<li>Abonamentul va expira la</li>
	<li><%=rs.getString("expDate")%></li>
	<%
  		if(rs.getInt("intrare")==-1){
			bufferstring1="Intrari nelimitate";
			%>
			<li>Aveti <%=bufferstring1 %> </li>
			<%
   			}
   		else 
   		{ bufferstring1=java.lang.String.valueOf(rs.getInt("intrare"));}
			
	%>
	<li>Aveti <%=bufferstring1 %> ramase </li>
	<% 
	if(rs.getString("Antrenor")=="Fara Antrenor"){	
	%>
	<li>Nu aveti antrenor</li>
	<%
	}
	else
	{
	%>
	<li> Antrneorul dumneavoastra este <%=rs.getString("Antrenor")%></li>
	<%
	}
%> 
</ul>

<%
	}
else{
	%>
	<p>Nu aveti un abonament puteti sa cumparati un abonament nou in tabul abonament</p>
	
	<%
}
%>



</body>
</html>