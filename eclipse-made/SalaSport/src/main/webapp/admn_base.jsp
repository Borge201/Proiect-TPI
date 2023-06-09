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
        ResultSet rs,rs1;
        int x;
        if (Email!=null && PassW!=null){
        jb.connect();
        rs1=jb.checkUser(Email,PassW);
        rs1.next();
        	if(rs1.getInt("exista")==1){
        	rs=jb.logInUser(Email,PassW);
        	rs.next();
        	if(rs.getInt("isAdmin")==1)
        	{x=rs.getInt("idClienti");
        	jb.setClientID(x);
        	jb.setClientMail(Email);
        	jb.disconnect();
        
        %>
        <script>
        (function goToUserHome(){
        	location.replace("admn_home_base.jsp")
        })();
        </script>
        <%
        	}
        	}
        else{
        %>
        
        <script>
        (function emailFolosit(){
        	alert("Email-ul sau parola sunt incorecte sau utilizatorul nu exista!")
        })();
        </script>
       <script>
       (function goToUserHome(){
       	location.replace("admn_login.jsp")
       })();
       </script>
       <%
        }
        jb.disconnect();
        }
        %>
    </body>
</html>

