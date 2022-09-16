<%@ page errorPage="errorInsert.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*,javax.sql.*,java.io.*,java.net.*" %>
<html>
<head>

<meta charset="UTF-8" />
</head>
<body>
<%
    Class.forName("com.mysql.jdbc.Driver"); 
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc","root" , "");
    Statement stmt = conn.createStatement(); 
	int NewStdId = 0;
    int cnt = 1;
    int tempNum = 0;
    int insertNum = 209901;
	ResultSet rset = stmt.executeQuery("select max(studentid) from examtable4");
	ResultSet rset2 = stmt.executeQuery("select studentid from examtable4"); 
    while(rset2.next()){
        tempNum = rset2.getInt(1)-209900;
        if(cnt!=tempNum){
            insertNum = cnt+209900;
            break;
        }
        cnt++;
        insertNum=tempNum+209900+1;
    }
    NewStdId = insertNum;
	String cTmp = request.getParameter("name");
	String cTmpHan = new String(cTmp.getBytes("8859_1"),"utf-8");
	stmt.execute("insert into examtable4 (name, studentid, kor, eng, mat) values('"+ cTmpHan +"',"+ Integer.toString(NewStdId) + "," +
	request.getParameter( "korean" ) + "," +
	request.getParameter( "english" ) + "," +
	request.getParameter( "math" ) + ");");
	stmt.close();
	conn.close();
	

%>
<h1>성적 추가입력 완료</h1>

	<form method='post' action='inputForm1.html'>
		<table cellspacing=1 width=400 border=0>
		<tr>
			<td width=300></td>
			<td width=100><input type="submit" value="뒤로가기"></td>
		</tr>
		</table>
		<table cellspacing=1 width=400 border=1>
		<tr>
			<td width=100><p align=center>이름</p></td>
			<td width=300><p align=center><input type='text' name='name' value='<%=cTmpHan%>' readonly></p></td>
		</tr>
			<td width=100><p align=center>학번</p></td>
			<td width=300><p align=center><input type='text' name='studentid' value='<%=Integer.toString(NewStdId)%>' readonly></p></td>
		</tr>
			<td width=100><p align=center>국어</p></td>
			<td width=300><p align=center><input type='text' name='korean' value='<%=request.getParameter( "korean" )%>' readonly></p></td>
		</tr>
			<td width=100><p align=center>영어</p></td>
			<td width=300><p align=center><input type='text' name='english' value='<%=request.getParameter( "english" )%>' readonly></p></td>
		</tr>
			<td width=100><p align=center>수학</p></td>
			<td width=300><p align=center><input type='text' name='math' value='<%=request.getParameter( "math" )%>' readonly></p></td>
		</tr>
		</table>
	</form>
</body>
</html>
