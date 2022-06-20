<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*,javax.sql.*,java.io.*,java.net.*" %>
<html>
<head>
<meta charset="UTF-8" />
<style type="text/css">
input:invalid {
  border-radius: 10px;
  border: 2px solid red;
}
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
} 
</style> 
<meta charset="UTF-8" />
<SCRIPT LANGUAGE="JavaScript">			//자바스크립트부분 
function submitForm(mode){				//submitform이라는 함수 정의
	if(mode == "update"){				//만약 mode값이 update라면,
		myform.action = "updateDB.jsp"; //포맷 myform의 action을 updateDB로 하고 
	}else if(mode == "delete"){			//만일 수정이 아니라 mode값이 delete라면 
		myform.action = "deleteDB.jsp"; //action을 deleteDB로 하고 
	}
}
</SCRIPT>
</head>
<body>
<%
    Class.forName("com.mysql.jdbc.Driver"); 	// JDBC driver
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc","root" , "CJDghd9311@");
    											// DB 연결 주소, 아이디, 비밀번호 
    Statement stmt = conn.createStatement(); 	// Statement 선언 
	String name="", studentid="", kor="", eng="", mat="", sum="", avg="", ran=""; //이름, 학번, 국어, 영어, 수학 점수 기본값 정의 
	String ctmp = request.getParameter("searchid");		  //ctmp값은 searchid(조회할 학번)에서 값을 받아온다 
	if (ctmp.length() == 0) ctmp = "0";					  //학번을 입력하지 않아서 0자리이면 값을 0으로 한다.
    ResultSet rset = stmt.executeQuery("select *, (select count(*) + 1 from examtable4 as A where (A.kor + A.eng + A.mat ) > ( B.kor + B.eng + B.mat)) as 등수 from examtable4 as B where studentid = " + ctmp + ";");
	// 해당 학번의 값을 전부 받아온다.
	while (rset.next()) { 
		name=rset.getString(1); 					//받아온 값에서 name, studentid, kor, eng, mat의 값을 넣어준다.
		studentid=Integer.toString(rset.getInt(2));
		kor=Integer.toString(rset.getInt(3));
		eng=Integer.toString(rset.getInt(4));
		mat=Integer.toString(rset.getInt(5));
		sum=Integer.toString(rset.getInt(3) + rset.getInt(4) + rset.getInt(5));
		avg=Integer.toString((rset.getInt(3) + rset.getInt(4) + rset.getInt(5)) / 3);
		ran=Integer.toString(rset.getInt(6));
	}
	stmt.close();
	conn.close();
%>
<h1>성적조회 후 정정/삭제</h1>
	<form method='post' action='showREC.jsp'>
		<table cellspacing=1 width=400 border=0>
		<tr>
			<td width=100><p align=center>조회할 학번</p></td>
			<td width=200><p align=center><input type='number' min='209900' max='220000' name='searchid' value=''></p></td>
			<td width=100><input type="submit" value="조회"></td>
		</tr>
		</table>
	</form>
	<form method='post' name='myform'>
		<table cellspacing=1 width=400 border=1>
		<tr>
			<td width=100><p align=center>이름</p></td>
			<td width=300><p align=center><input type='text' name='name' pattern="[가-힣a-zA-Z]{2,10}" title='한글,영어 2~10자로 입력해주세요' value='<%=name%>'></p></td>
		</tr>
			<td width=100><p align=center>학번</p></td>
			<td width=300><p align=center><input type='text' name='studentid' value='<%=studentid%>' readonly></p></td>
		</tr>
			<td width=100><p align=center>국어</p></td>
			<td width=300><p align=center><input type='number' name='korean' min = '0' max = '100' value='<%=kor%>'></p></td>
		</tr>
			<td width=100><p align=center>영어</p></td>
			<td width=300><p align=center><input type='number' name='english' min = '0' max = '100' value='<%=eng%>'></p></td>
		</tr>
			<td width=100><p align=center>수학</p></td>
			<td width=300><p align=center><input type='number' name='math' min = '0' max = '100' value='<%=mat%>'></p></td>
		</tr>
			<td width=100><p align=center>합계</p></td>
			<td width=300><p align=center><input type='number' name='sum' min = '0' max = '300' value='<%=sum%>' readonly></p></td>
		</tr>
			<td width=100><p align=center>평균</p></td>
			<td width=300><p align=center><input type='number' name='avg' min = '0' max = '100' value='<%=avg%>' readonly></p></td>
		</tr>
			<td width=100><p align=center>등수</p></td>
			<td width=300><p align=center><input type='number' name='ran' min = '0' max = '500' value='<%=ran%>' readonly></p></td>
		</tr>
		</table>
<%
	if(studentid.length()!=0){	//학번이 입력되었으면 
		out.println("<table cellspacing=1 width=400 border=0>"); //테이블을 만들고 
		out.println("<tr>");
		out.println("<td width=200></td>");   
		out.println("<td width=100><p align=center><input type=submit value=\"수정\" Onclick=\"submitForm('update')\"</p></td>"); //수정버튼을 눌렀을 때 update Form을 불러온다.
		out.println("<td width=100><p align=center><input type=submit value=\"삭제\" Onclick=\"submitForm('delete')\"</p></td>"); //삭제버튼을 눌렀을 때 delete Form을 불러온다.
		out.println("</tr>");
		out.println("</table>");
	}
%>
	</form>
</body>
</html>