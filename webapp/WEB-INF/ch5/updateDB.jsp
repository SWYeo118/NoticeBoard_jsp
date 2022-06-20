<%@ page errorPage="errorUpdate.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*,javax.sql.*,java.io.*,java.net.*" %>
<html>
<head>
<meta charset="UTF-8" />
</head>
<body>
<h1>레코드 수정 완료</h1>
<%
    Class.forName("com.mysql.jdbc.Driver"); 
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc","root" , "CJDghd9311@");
    Statement stmt = conn.createStatement(); 
	String cTmp = request.getParameter("name");		// 이름에서 cTmp값을 받아오고 
	String cTmpHan = new String(cTmp.getBytes("8859_1"),"utf-8"); //cTmp값을 UTF-8로 변환해서 cTmpHan으로 한다.
	String sql = "update examtable4 set " +
		"name ='" +cTmpHan+"', " +
		"kor = " + request.getParameter("korean") + ", " +
		"eng = " + request.getParameter("english") + ", " +
		"mat = " + request.getParameter("math" ) +
		" where studentid = " + request.getParameter("studentid");
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
		if(request.getParameter("studentid").equals(Integer.toString(rset.getInt(2)))){
		out.println("<tr bgcolor = '#ffff00' >");
		out.println("<td width=50><p align=center><a href='oneviewDB.jsp?key=" + rset.getString(1) + "'> " + rset.getString(1) + "</a></p></td>");
		out.println("<td width=50><p align=center>" + Integer.toString(rset.getInt(2)) + "</p></td>");
		out.println("<td width=50><p align=center>" + Integer.toString(rset.getInt(3)) + "</p></td>");
		out.println("<td width=50><p align=center>" + Integer.toString(rset.getInt(4)) + "</p></td>");
		out.println("<td width=50><p align=center>" + Integer.toString(rset.getInt(5)) + "</p></td>");
		out.println("</tr>");
	} else {
		out.println("<tr>");
		out.println("<td width=50><p align=center><a href='oneviewDB.jsp?key=" + rset.getString(1) + "'> " + rset.getString(1) + "</a></p></td>");
		out.println("<td width=50><p align=center>" + Integer.toString(rset.getInt(2)) + "</p></td>");
		out.println("<td width=50><p align=center>" + Integer.toString(rset.getInt(3)) + "</p></td>");
		out.println("<td width=50><p align=center>" + Integer.toString(rset.getInt(4)) + "</p></td>");
		out.println("<td width=50><p align=center>" + Integer.toString(rset.getInt(5)) + "</p></td>");
		out.println("</tr>");
		}
	}
	rset.close();
	stmt.close();
	conn.close();
%>
</body>
</html>