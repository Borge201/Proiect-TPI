<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        String Email=request.getParameter("Email");
        String PassW =request.getParameter("PassW");
        if (Email!=null && PassW!=null)
        {jb.connect();
        ResultSet rs;
        rs=jb.logInUser(Email,PassW);
        if(rs!=null) {%>
        	<p><%= rs.getString("clientEmail")%></p>
            <p><%= rs.getString("idClient")%></p>
        <%}
        jb.disconnect();
        %>
        <p>Log in succesfull</p>
        
        <%
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
                    <td><input type="text" name="PassW" requierd /></td>
                </tr>
  
            </table>
            <button type="submit">Log in</button>
            
        </form>
        <%
        }
        %>
        <h2><a href="index.html" >Inapoi la pagina principala</a></h2>
    </body>
</html>