<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*,java.net.*"%>

<html>
<!-html 태그로 작성됨을 알려주는 시작->
<head>
<!-글의 머리말->
<meta charset="utf-8" />
<!-UTF-8로 작성되었다는 것을 알려주어 한글이 안깨지게->
</head>
<body>
	<!-본문->
	<strong><center>
			<h1>JSP Database 실습
		</center>
		</h1></strong>
	<%
	String data;
	int cnt=0;
	FileReader fl = new FileReader("/Users/sangwoo/Desktop/abc/cnt.txt");
	StringBuffer sb = new StringBuffer();
	int ch = 0;
	while((ch = fl.read()) != -1){
		sb.append((char)ch);
	}
	data=sb.toString().trim().replace("\n","");
	fl.close();
	cnt=Integer.parseInt(data);
	cnt++;
	data=Integer.toString(cnt);
	out.println("<br><br><center>현재 홈페이지 방문조회수는 ["+data+"] 입니다</center></br>");
	FileWriter fl2 = new FileWriter("/Users/sangwoo/Desktop/abc/cnt.txt",false);
	fl2.write(data);
	fl2.close();
%>
</body>
</html>