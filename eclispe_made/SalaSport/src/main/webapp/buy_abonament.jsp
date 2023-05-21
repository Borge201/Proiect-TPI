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
<form action="user_abonamet.jsp" method="get">
<table>
<tr>
                    <td align="Right">ID:Client</td>
                    <td><input type="text" name="idclient" required /></td>
                </tr>
                <%
                /*
                *asta e un work around pana cand pot sa fac log inul s amearga
                *bine ca macar asta merge
                *macar atat
                *Mihai daca ai sugesti sa sti ca sunt deschis la idei
                *poate o iesi ceva mai bine
                * corectie poate o iesi CEVA
                */
                %>
<tr>
<td align="right">Antrenor:</td>
<td align="right"><select name="Antrenori" required>
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
</body>
</html>