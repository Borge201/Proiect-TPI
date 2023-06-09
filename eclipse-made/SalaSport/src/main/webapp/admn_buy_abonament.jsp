<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,sala.*,java.sql.*, java.io.*, java.util.*"%>
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
jb.connect();
ResultSet rs;
rs=jb.checkAbonament(java.lang.Integer.parseInt(request.getParameter("primarykey")));

rs.next();
if(rs.getInt("exista")==1){
%>
<form action="admn_abonamet_mod.jsp" method="get">
<table>
<tr>
<td align="right"><input name="idUser" type="hidden" value="<%=java.lang.Integer.parseInt(request.getParameter("primarykey")) %>"/></td>
</tr>

<tr>
<td align="right">Antrenor:</td>
<td align="right"><select name="Antrenori" required>
<option value="Fara Antrenor">Alegeti antrenorul</option>
<option value="Fara Antrenor">Fara Antrenor</option>
<option value="Antrenor 1">Antrenor 1</option>
<option value="Antrenor 2">Antrenor 2</option>
<option value="Antrenor 3">Antrenor 3</option>
</select>
</td>
</tr>
 <tr>
<td align="Right">Intrari:</td>
<td align="right"><select name="Intrari" required>
<option value="30">30 intrari</option>
<option value="60">60 intrari</option>
<option value="365">Intrari cat un an</option>
<option value="-1">Nelimitat</option>
</select>
</td>
</tr>
 <tr>
<td align="Right">Zile:</td>
<td align="right"><select name="Zile" required>
<option value="30">30 zile</option>
<option value="60">60 zile</option>
<option value="365">un an</option>
</select>
</td>
</tr>
</table>

 <button type="submit">Cumpara Abonament</button>

</form>









<%





	
	

}

else {
%>
<form action="admn_abonamet.jsp" method="get">
<table>
<tr>
<td align="right"><input name="idUser" type="hidden" value="<%=java.lang.Integer.parseInt(request.getParameter("primarykey")) %>"/></td>
</tr>
<tr>
<td align="right">Antrenor:</td>
<td align="right"><select name="Antrenori" required>
<option value="Fara Antrenor">Alegeti antrenorul</option>
<option value="Fara Antrenor">Fara Antrenor</option>
<option value="Antrenor 1">Antrenor 1</option>
<option value="Antrenor 2">Antrenor 2</option>
<option value="Antrenor 3">Antrenor 3</option>
</select>
</td>
</tr>
 <tr>
<td align="Right">Intrari:</td>
<td align="right"><select name="Intrari" required>
<option value="30">30 intrari</option>
<option value="60">60 intrari</option>
<option value="365">Intrari cat un an</option>
<option value="-1">Nelimitat</option>
</select>
</td>
</tr>
 <tr>
<td align="Right">Zile:</td>
<td align="right"><select name="Zile" required>
<option value="30">30 zile</option>
<option value="60">60 zile</option>
<option value="365">un an</option>
</select>
</td>
</tr>
</table>

 <button type="submit">Cumpara Abonament</button>
<%
}
jb.disconnect();
%>
<a href="admn_home_base.jsp">Home</a>
</form>
</body>
</html>