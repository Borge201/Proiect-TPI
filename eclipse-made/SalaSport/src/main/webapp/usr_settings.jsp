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
        <title>User home</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="sala.Sala"/>
    <jsp:setProperty name="jb" property="*"/>
    <body>
    <header>
        <h1>Fitness Tracker</h1>
        <nav>
            <ul>
                <li class="active"><a href="usr_base.jsp">Home</a></li>
                <li><a href="PaginaWorkouts.jsp">Workouts</a></li>
                <li><a href="PaginaNutrition.jsp">Nutrition</a></li>
                <li><a href="PaginaProgress.jsp">Tracker</a></li>
                <li><a href="usr_settings.jsp"><b><%=jb.getClientMail()%></b></a></li>
                <li><a href="buy_abonament.jsp">Abonamente</a></li>
                <li><a href="usr_logout.jsp">Log out</a></li>
            </ul>
        </nav>
   </header>
    <main>
    <div>
    <p>Pentru a schimba parola apasati butonul</p>
    <button class="button" onclick="window.location.href='usr_newPass.jsp';" >Schimbati parola.</button>
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
    </div>
    
    
    
    
     </main>
    <footer>
        <p>&copy; 2023 Fitness Tracker. All rights reserved.</p>
    </footer>  
    </body>
</html>
<style>
 body {
    font-family: Arial, sans-serif;
    background-color: #f2f2f2;
    margin: 0;
}

header {
    background-color: #333;
    color: #fff;
    padding: 20px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

header h1 {
    margin: 0;
}

nav ul {
    margin: 0;
    padding: 0;
    display: flex;
}

nav ul li {
    list-style: none;
}

nav ul li a {
    display: block;
    color: #fff;
    padding: 10px;
    text-decoration: none;
}

nav ul li a:hover {
    background-color: #ddd;
    color: #333;
}

nav ul li.active a {
    background-color: #ddd;
    color: #333;
}

main {
    max-width: 85%;
    margin: 20px auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 5px;
}

h2 {
    margin-top: 0;
}

form {
    display: flex;
    flex-wrap: wrap;
}

form div {
    margin-right: 20px;
}

form div:last-child {
    margin-right: 0;
}

label {
    display: block;
    margin-bottom: 5px;
}

input[type="number"],
input[type="text"],
select {
    border: none;
    border-bottom: 1px solid #333;
    margin-top: 5px;
    margin-bottom: 10px;
    padding: 5px;
}

table {
    border-collapse: collapse;
    margin-top: 20px;
    margin-bottom: 20px;
}

table th,
table td {
    border: 1px solid #333;
    padding: 5px;
}

table th {
    background-color: #333;
    color: #fff;
}

table td:first-child {
    font-weight: bold;
}