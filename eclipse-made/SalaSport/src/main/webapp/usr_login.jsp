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
    <header>
        <h1>Fitness Tracker</h1>
        <nav>
            <ul>
                <li class="active"><a href="index.html">Home</a></li>
                <li><a href="usr_sigup.jsp"><b>Sign up</b></a></li>
                <li><a href="usr_login.jsp"><b>Log in</b></a></li>
            </ul>
        </nav>
   </header>
    <body>
    <main>
        <h1>Log in utilizator</h1> <button type="button" onclick="location.href='admn_login.jsp'">Admin</button>
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
            <button class="button" type="submit">Log in</button>
            
        </form>
    </body>
    </main>
</html>


<style>
 body {
    font-family: Arial, sans-serif;
    background-color: #f2f2f2;
    margin: auto;
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
    margin: auto;
    
}
.button{
border-radius: 4px;
transition-duration: 0.4s;
color: white;
text-align: center;
cursor: pointer;
}
.button:hover{
background-collor: #0099ff;
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
input[type="password"],
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
