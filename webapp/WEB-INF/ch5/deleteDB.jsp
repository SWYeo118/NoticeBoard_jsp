<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*,javax.sql.*,java.io.*,java.net.*" %>
<html>
<head>
<meta charset="UTF-8" />
</head>
<body>
<h1>레코드 삭제 완료</h1>
<%
    Class.forName("com.mysql.jdbc.Driver"); 
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc","root" , "");
    Statement stmt = conn.createStatement(); 
	String ctmp = request.getParameter("studentid");
	String sql = "delete from examtable4 where studentid = " + ctmp;
	stmt.executeUpdate(sql);
	ResultSet rset = stmt.executeQuery("select * from examtable4;");
%>
<table cellspacing=1 width=600 border=1>
	<tr>
		<td width=50><p align=center>이름</p></td>
		<td width=50><p align=center>학번</p></td>
		<td width=50><p align=center>국어</p></td>
		<td width=50><p align=center>영어</p></td>
		<td width=50><p align=center>수학</p></td>
	</tr>
<%
	while(rset.next()) {
		out.println("<tr>");
		out.println("<td width=50><p align=center><a href='oneviewDB.jsp?key=" + rset.getString(1) + "'> " + rset.getString(1) + "</a></p></td>");
		out.println("<td width=50><p align=center>" + Integer.toString(rset.getInt(2)) + "</p></td>");
		out.println("<td width=50><p align=center>" + Integer.toString(rset.getInt(3)) + "</p></td>");
		out.println("<td width=50><p align=center>" + Integer.toString(rset.getInt(4)) + "</p></td>");
		out.println("<td width=50><p align=center>" + Integer.toString(rset.getInt(5)) + "</p></td>");
		out.println("</tr>");
	} 
	rset.close();
	stmt.close();
	conn.close();
%>
</body>
</html>
