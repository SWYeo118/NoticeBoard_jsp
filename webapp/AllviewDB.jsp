<meta http-equiv="Content-Type" content="text/html/css; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8"%>
<%@page import="kr.ac.kopo.ctc.kopo25.dto.Pagination"%>
<%@page import="kr.ac.kopo.ctc.kopo25.dto.Score"%>
<%@page import="kr.ac.kopo.ctc.kopo25.service.ScoreItemServiceImpl"%>
<%@page import="kr.ac.kopo.ctc.kopo25.service.ScoreItemService"%>
<%@ page import="java.util.*,java.sql.*,javax.sql.*,java.io.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
ServletContext context = getServletContext();
Score score = new Score();
ScoreItemService scoreitemservice = new ScoreItemServiceImpl();
List<Score> scoreViewDatas = scoreitemservice.allView();
int numOfPosts = scoreitemservice.getTotalCount();
Pagination getpagination = scoreitemservice.getPagination(1, 10, 20, numOfPosts);
context.setAttribute("scoreViewDatas", scoreViewDatas);
context.setAttribute("getpagination", getpagination);
%>
<html>
<head>
<style type="text/css">
a {
	text-decoration: none
}
</style>
<meta charset="UTF-8" />
</head>
<body>
	<h1>
		<center>학생 전체 조회</center>
	</h1>

	<table cellspacing=1 width=600 align=center border=1>
		<tr>
			<td width=50><p align=center>이름</p></td>
			<td width=50><p align=center>학번</p></td>
			<td width=50><p align=center>국어</p></td>
			<td width=50><p align=center>영어</p></td>
			<td width=50><p align=center>수학</p></td>
		</tr>
		<c:set var="i" value="9" />
		<%-- 		<c:out value="${getpagination.getNnPage()}" />
		이렇게 하면 마지막페이지가 출력 --%>
		<c:forEach var="scoreViewData" begin="0" end="19" step="1"
			items="${scoreViewDatas}">
			<tr>
				<td width=50><p align=center>
						<c:out value="${scoreViewData.name}" />
					</p></td>
				<td width=50><p align=center>
						<c:out value="${scoreViewData.studentid}" />
					</p></td>
				<td width=50><p align=center>
						<c:out value="${scoreViewData.kor}" />
					</p></td>
				<td width=50><p align=center>
						<c:out value="${scoreViewData.eng}" />
					</p></td>
				<td width=50><p align=center>
						<c:out value="${scoreViewData.mat}" />
					</p></td>
			</tr>
		</c:forEach>
	</table>
	<table cellspacing=1 width=600 align=center border=0>
		<tr>
			<br>
			<td width=50><p align=center>
					<font size=5><<</font>
				</p></td>
			<td width=50><p align=center>
					<font size=5> <</font>
				</p></td>
			<c:forEach var="k" begin="1" end="10" step="1">
				<td width=50><p align=center>
						<font size=6><c:out value="${k }" /></font>
					</p></td>
			</c:forEach>
			<td width=50><p align=center>
					<font size=5> ></font>
				</p></td>
			<td width=50><p align=center>
					<font size=5>>></font>
				</p></td>
		</tr>
	</table>
</body>
</html>