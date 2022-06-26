<%@page import="kr.ac.kopo.ctc.kopo25.service.ScoreItemServiceImpl"%>
<%@page import="kr.ac.kopo.ctc.kopo25.service.ScoreItemService"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*,java.net.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%
ScoreItemService a = new ScoreItemServiceImpl();
int data = a.retunViewNum();
ServletContext context = getServletContext();
context.setAttribute("data", data);
%>
<html>
<head>
<meta charset="utf-8" />
</head>
<body>
	<strong>
		<center>
			<h1>JSP Database 실습</h1>
		</center>
	</strong><br><br>
	<center>
		<c:out value="안녕하세요 현재 방문자 수는 [${data}]명입니다" />
	</center>
	</br>
</body>
</html>