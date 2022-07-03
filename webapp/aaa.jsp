    
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ page contentType="text/html; charset=utf-8" %>
    <%@ page import="java.sql.*,javax.sql.*,java.io.*,java.net.*,org. w3c.dom.*,javax.xml.parsers.DocumentBuilder,javax.xml.parsers.DocumentBuilderFactory,javax.xml.parsers.ParserConfigurationException" %>
    <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <%-- <jsp:include page="menu.jsp"></jsp:include> --%>
    <%

   
    DocumentBuilder docBuilder = DocumentBuilderFactory.newInstance().newDocumentBuilder(); 
    //localhost가 아닌 데이터가 있는 back서버의 ip로 들어감
    Document doc = docBuilder.parse("http://192.168.23.90:8083/bulletin/xmlmake.jsp"); 

    Class.forName("com.mysql.jdbc.Driver"); //드라이버
    Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.90:33063/koposw23","root","koposw23"); //커넥션
    Statement stmt = conn.createStatement(); //스테이트먼트

    String QueryTxt2="";
    QueryTxt2=String.format("drop table bulletin;");
    String QueryTxt3="";
    QueryTxt3=String.format("create table bulletin (id int not null primary key auto_increment, title varchar(70), log_date date, context text) default charset=utf8;");
    
    Element root = doc.getDocumentElement(); //각 data안에서
    NodeList tag_id = doc.getElementsByTagName("idNum");  
    NodeList tag_title = doc.getElementsByTagName("title"); 
    NodeList tag_date = doc.getElementsByTagName("dates"); 

    //테이블 하나 만들고 5개 행(column) 생성
    out.println("<div class='container-fluid'>");
    out.println("<table class='table table-bordered'>");
    out.println("<thead><tr>");
    out.println("<th width=100px height=60px>번호</th>");
    out.println("<td width=600px>제목</td>");
    out.println("<td width=200px>날짜</td>");
    out.println("</tr></thead><tbody>");
    if (tag_id.getLength() !=0){
        for (int i=tag_id.getLength()-1;i>=0;i--) {
            out.println("<tr>");
            out.println("<th height=40px>"+tag_id.item(i).getFirstChild().getNodeValue()+"</th>");
            out.println("<td><a href='oneview.jsp?id="+tag_id.item(i).getFirstChild().getNodeValue()+"'>"+tag_title.item(i).getFirstChild().getNodeValue()+"</a></td>");
            out.println("<td>"+tag_date.item(i).getFirstChild().getNodeValue()+"</td>");
            out.println("</tr>");
        }
        out.print("</tbody></table>");
        out.print("</div>");
    }else if(tag_id.getLength() == 0) {
        out.println("<tr><td colspan=3><center>게시판에 등록된 글이 없습니다</center></td></tr></table>");
        stmt.execute(QueryTxt2); //테이블 삭제
        stmt.execute(QueryTxt3); //테이블 삭제
    }

    stmt.close();
    conn.close();
    %>
   
    <button style="margin-left: 95.7%; width: 70px;" onClick="location.href='insert.jsp'">신규</button>
    <%-- <jsp:include page="footer.jsp"></jsp:include> --%>
</body>
</html>