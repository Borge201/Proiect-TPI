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
    int x=jb.getClientID();
    %>   
    <script src="qrcode.min.js"></script>

<div id="qrcode" align="center"></div>

<script>
var prefix = 'http://google.com/searc?q=';
var sufix = '<%=x%>';
var total = prefix + sufix;
const qrcode = new QRCode(document.getElementById('qrcode'), {
  text: total,
  width: 256,
  height: 256,
  colorDark : '#000',
  colorLight : '#fff',
  correctLevel : QRCode.CorrectLevel.H
});
    </script>
 </body>
</html>
