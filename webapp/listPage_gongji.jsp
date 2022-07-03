<%@page import="java.util.List"%>
<%@ page import="java.util.*,java.sql.*,javax.sql.*,java.io.*"%>
<%@page import="kr.ac.kopo.ctc.kopo25.dao.NoticeDao"%>
<%@page import="kr.ac.kopo.ctc.kopo25.dto.Notice"%>
<%@page import="kr.ac.kopo.ctc.kopo25.dao.NoticeDaoImpl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
ServletContext context = getServletContext();
NoticeDao noticedao = new NoticeDaoImpl();
Notice notice = new Notice();
List<Notice> noticeDatas = noticedao.selectAll();
context.setAttribute("noticeDatas", noticeDatas);
%>
<!DOCTYPE html>
<html>
<head>
<style>
a {
	  text-decoration-line: none;
}
</style>

<SCRIPT LANGUAGE="JavaScript">
</SCRIPT>
<meta charset="UTF-8">
</head>
<body>
	<table cellspacing=1 cellpadding=1 width=600 border=1>
		<tr>
			<td width=50><p align=center>번호</p></td>
			<td width=500><p align=center>제목</p></td>
			<td width=100><p align=center>등록일</p></td>
		</tr>
		<c:forEach var="noticeData" items="${noticeDatas}">
			<tr>
				<td width=50><p align=center>
						<c:out value="${noticeData.id}" />
					</p></td>
				<td width=500><p align=center>
						<a href='detailOnePage_gongji.jsp?key=${noticeData.id}'><c:out
								value="${noticeData.title}" /></a>
					</p></td>
				<td width=100><p align=center>
						<c:out value="${noticeData.date}" />
					</p></td>
			</tr>
		</c:forEach>
	</table>
	<table width=650>
		<tr>
			<td width=550></td>
			<td><input type=button value="신규"
				OnClick="window.location='writePage_gongji.jsp'"></td>
		</tr>
	</table>
</body>
</html>