<%@ page errorPage="errorDrop.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*,javax.sql.*,java.io.*" %>
<html>
<head>
<meta charset="UTF-8" />
</head>
<body>
<h1>테이블 삭제 완료</h1>
<%
     Class.forName("com.mysql.jdbc.Driver"); 
     Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc","root" , "");
     Statement stmt = conn.createStatement(); 
     stmt.execute("drop table examtable4");			// 테이블 삭제 쿼리
     stmt.close(); 
     conn.close(); 
%>
</body>
</html>
