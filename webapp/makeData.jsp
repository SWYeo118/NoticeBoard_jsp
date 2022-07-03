<%@page import="kr.ac.kopo.ctc.kopo25.dao.NoticeDao"%>
<%@page import="kr.ac.kopo.ctc.kopo25.dao.NoticeDaoImpl"%>
<meta http-equiv="Content-Type" content="text/html/css; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*,java.sql.*,javax.sql.*,java.io.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
/* ServletContext context = getServletContext(); */
/* context.setAttribute("getpagination", getpagination); */
NoticeDao noticedao = new NoticeDaoImpl();
noticedao.makingTable();
%>
<html>
<head>
<meta charset="UTF-8" />
</head>
<body>
</body>
</html>