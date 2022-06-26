<%-- <%@ page errorPage="errorSet.jsp" %> --%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*,javax.sql.*,java.io.*" %>
<html>
<head>
<meta charset="UTF-8" />
</head>
<body>
<h1>테이블 데이터 입력 완료</h1>
<%
     Class.forName("com.mysql.jdbc.Driver"); 
     Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc","root" , "CJDghd9311@");
     Statement stmt = conn.createStatement();
     stmt.execute("insert into examtable4 (name, studentid, kor, eng, mat) values('나연'," + (Math.random() * 100000 + 1) + ", 95,100,95)");// 각각의 데이터 입력 쿼리 
  	 stmt.execute("insert into examtable4 (name, studentid, kor, eng, mat) values('정연'," + (Math.random() * 100000 + 1) + ", 95,95,95)");
	 stmt.execute("insert into examtable4 (name, studentid, kor, eng, mat) values('모모'," + (Math.random() * 100000 + 1) + ", 100,100,100)");
	 stmt.execute("insert into examtable4 (name, studentid, kor, eng, mat) values('사나'," + (Math.random() * 100000 + 1) + ", 100,95,90)");
	 stmt.execute("insert into examtable4 (name, studentid, kor, eng, mat) values('지효'," + (Math.random() * 100000 + 1) + ", 80,100,70)");
	 stmt.execute("insert into examtable4 (name, studentid, kor, eng, mat) values('미나'," + (Math.random() * 100000 + 1) + ", 100,100,70)");
	 stmt.execute("insert into examtable4 (name, studentid, kor, eng, mat) values('다현'," + (Math.random() * 100000 + 1) + ", 70,70,70)");
	 stmt.execute("insert into examtable4 (name, studentid, kor, eng, mat) values('채영'," + (Math.random() * 100000 + 1) + ", 80,75,72)");
	 stmt.execute("insert into examtable4 (name, studentid, kor, eng, mat) values('쯔위'," + (Math.random() * 100000 + 1) + ", 78,79,82)");  
     stmt.close(); 
     conn.close(); 
%>
</body>
</html>
