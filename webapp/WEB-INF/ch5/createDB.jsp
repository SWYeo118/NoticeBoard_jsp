<%@ page errorPage="errorCreate.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*,javax.sql.*,java.io.*" %>
<html>
<head>
<meta charset="UTF-8" />
</head>
<body>
<h1>테이블 생성 완료</h1>
<%
     Class.forName("com.mysql.jdbc.Driver"); 		//jdbc 드라이버 사용
     Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc","root" , "");
													//Mysql DB의 주소와 아이디와 비밀번호
     Statement stmt = conn.createStatement(); 
     stmt.execute("create table examtable4("+"name varchar(20),"+ "studentid int not null primary key,"+ "kor int,"+ "eng int,"+ "mat int)"); 
													//테이블을 생성하는 쿼리 작성, 이름, 학번, 국, 영, 수 점수를 테이블로 만듦
     stmt.close(); 
     conn.close(); 
%>
</body>
</html>
