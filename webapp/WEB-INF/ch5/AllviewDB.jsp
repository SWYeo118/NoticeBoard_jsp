<%@ page errorPage="errorAllview.jsp" %>
<%String code = request.getParameter("from");                     //from에서 값을 받아서 null값이면(주소가 wifi.jsp면)
if (code == null) {                                          //sendRedirect으로 from1&cnt10으로 보내준다.
   response.sendRedirect("AllviewDB.jsp?from=1&cnt=10");
   } else { %>
<meta http-equiv="Content-Type" content="text/html/css; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*,javax.sql.*,java.io.*" %>
<html>
<head>
<style type="text/css"> 
a { text-decoration:none }
</style> 
<meta charset="UTF-8" />
</head>
<body>
<h1><center>학생 전체 조회</center></h1>
<%
     Class.forName("com.mysql.jdbc.Driver"); 
     Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc","root" , "CJDghd9311@");
     Statement stmt = conn.createStatement();
     int from = 0;           
     //from값을 초기값 선언
     float howmany = 0;
     from = Integer.parseInt(request.getParameter("from"));            //getParameter로 쿼리스트링의 from값을 받아온다
     int cnt = Integer.parseInt(request.getParameter("cnt"));
     ResultSet rset2 = stmt.executeQuery("select count(*) from examtable4;"); 
     while (rset2.next()) { 
     howmany = rset2.getFloat(1);
     }
     int it = (int)(howmany / 10) + 1;
     ResultSet rset = stmt.executeQuery("CALL print_score_report("+ (from - 1) +",10);"); 
%>

<table cellspacing=1 width=600 align=center border = 1>
	<tr>
		<td width=50><p align=center>이름</p></td>		<!-- 테이블을 만들고 중앙 정렬-->
		<td width=50><p align=center>학번</p></td>
		<td width=50><p align=center>국어</p></td>
		<td width=50><p align=center>영어</p></td>
		<td width=50><p align=center>수학</p></td>
		<td width=50><p align=center>총점</p></td>
		<td width=50><p align=center>평균</p></td>
		<td width=50><p align=center>등수</p></td>
	</tr>
<%
     while (rset.next()) { 
         out.println("<tr>");
		 out.println("<td width=50><p align=center><a href='oneviewDB.jsp?key="		//각각의 값을가져오는데 이름을 누르면 onviewDB.jsp로 연결되어 1인만 조회하도록
		 +rset.getString(1)+"'>"+rset.getString(1)+"</a></p></td>");
		 out.println("<td width=50><p align=center>"+Integer.toString(rset.getInt(2))+"</p></td>");
		 out.println("<td width=50><p align=center>"+Integer.toString(rset.getInt(3))+"</p></td>");
		 out.println("<td width=50><p align=center>"+Integer.toString(rset.getInt(4))+"</p></td>");
		 out.println("<td width=50><p align=center>"+Integer.toString(rset.getInt(5))+"</p></td>");
		 out.println("<td width=50><p align=center>"+Integer.toString(rset.getInt(3) + rset.getInt(4) + rset.getInt(5))+"</p></td>");
		 out.println("<td width=50><p align=center>"+Integer.toString((rset.getInt(3) + rset.getInt(4) + rset.getInt(5)) / 3)+"</p></td>");
		 out.println("<td width=50><p align=center>"+Integer.toString(rset.getInt(6))+"</p></td>");
		 out.println("<tr>");
	}
out.println("</table>");
out.println("<br><br><br>");
out.println("<div style=" + "text-align:center" + ">");            //테이블 중간정렬
if(from < 12 && it > 10){
out.println("<a href=AllviewDB.jsp?from=1&cnt=10><FONT SIZE=6> << </FONT></a>");   //1~11페이지 상황에서는 <<버튼을 누르면 첫 페이지가 뜨도록
} else if(it > 10){                                                   //그렇지 않은 상황에서는 <<버튼을 누르면 10페이지씩 줄어들도록
out.println("<a href=AllviewDB.jsp?from=" + (from - 10) + "&cnt=10><FONT SIZE=6> << </FONT></a>");   
}
if(from < 5 && from <= it && howmany%10.0 != 0){                                                //현재페이지가 중간에 뜨고 양쪽에 5개씩 페이지를 띄울 것이므로
   for(int i = 1; i < it + 1; i++){                                 //5페이지 미만 상황에서는 무조건 1 ~ 10페이지를 띄운다
   out.println("<a href=AllviewDB.jsp?from=" + (i) + "&cnt=10><FONT SIZE=6>"+(i)+"</FONT></a>");   
   }
} else if( from > 495 && from <= it){                                          //또한 마지막 페이지가 273페이지이므로 268페이지 이후로부턴 264~273페이지가 뜨도록
   for(int i =491; i < 501; i++){
   out.println("<a href=AllviewDB.jsp?from=" + (i) + "&cnt=10><FONT SIZE=6>"+(i)+"</FONT></a>");
   } 
} else if( from == 5 && from <= it){                                          //else설정 하면 5페이지에서는 0페이지가 노출되니까 이를 막기 위해
   for(int i = from - 4; i < from + 6; i++){
   out.println("<a href=AllviewDB.jsp?from=" + (i) + "&cnt=10><FONT SIZE=6;>"+(i)+"</FONT></a>");   
   }
} else if(howmany % 10.0 != 0){
   for(int i = from - 1; i < it + 2; i++){                        //그렇지 않은 상황에서는 왼쪽에 5개, 현재페이지, 오른쪽 4페이지가 뜨도록 한다.
      out.println("<a href=AllviewDB.jsp?from=" + (i) + "&cnt=10><FONT SIZE=6;>"+(i)+"</FONT></a>");   
   }
}		//프롬은 몇페이지 보여줄꺼야? 0 1 2 3 4 5
		//it은 총 페이지수 2 3 4 5
if(from > 489 && from <= it){
out.println("<a href=AllviewDB.jsp?from=273&cnt=10><FONT SIZE=6> >> </FONT></a>");//262페이지가 넘어가면 >>를 눌렀을 때 마지막 페이지까지 뜨도록
} else if((from+10) <= it){
out.println("<a href=AllviewDB.jsp?from=" + (from + 10) + "&cnt=10><FONT SIZE=6> >> </FONT></a>"); //그렇지 않은 일반상황에서는 >> 누르면 10페이지 증가하도록
}
out.println("<br>");

     rset.close(); 
     stmt.close(); 
     conn.close(); 
%>
</body>
</html>
<% } %>