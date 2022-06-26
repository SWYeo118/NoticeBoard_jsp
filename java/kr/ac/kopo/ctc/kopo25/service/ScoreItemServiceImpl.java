package kr.ac.kopo.ctc.kopo25.service;

import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.ctc.kopo25.dto.Pagination;
import kr.ac.kopo.ctc.kopo25.dto.Score;

public class ScoreItemServiceImpl implements ScoreItemService {
	
	public ScoreItemServiceImpl() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // jdbc Driver에 연결
		} catch (ClassNotFoundException e) {
			throw new IllegalStateException("jdbc 드라이버 로드 실패" + e); // 연결 실패 시 에러메세지
		}
	}
	
	@Override
	public Pagination getPagination(int currPage, int countPerPage, int pageSize, int totalCount) {
		double lastPage_d = Math.ceil(totalCount / (float) pageSize);
		int lastPage = (int) lastPage_d;
		int firstPage = 1;
		Pagination p = new Pagination();

		if (currPage <= 0) {
			currPage = 1;
		} else if (currPage > lastPage) {
			currPage = lastPage;
		}

		if (totalCount <= 0) {
			totalCount = 1025;
		}
		if (pageSize <= 0) {
			totalCount = 50;
		}
		if (pageSize > totalCount) {
			pageSize = totalCount;
		}
		p.setPpPage(1);
		p.setNnPage(lastPage);
		p.setcPage(currPage);
		if (currPage + countPerPage > lastPage) {
			p.setnPage(lastPage);
		} else {
			if (currPage != 1 && currPage % countPerPage == 0 && currPage <= lastPage) {
				p.setnPage(1 + ((currPage / countPerPage) - 1) * countPerPage);
			} else if (currPage <= lastPage) {
				p.setnPage(1 + ((currPage / countPerPage) + 1) * countPerPage);
			}
		}
		if (currPage - countPerPage <= 0) {
			p.setpPage(1);
		} else {
			if (currPage != 1 && currPage % countPerPage == 0 && currPage >= firstPage) {
				p.setpPage(1 + ((currPage / countPerPage) - 1) * countPerPage);
			} else if (currPage >= firstPage) {
				p.setpPage(1 + ((currPage / countPerPage) - 1) * countPerPage);
			}
		}

		return p;
	}

	@Override
	public int retunViewNum() throws IOException {
		int cnt = 0, ch = 0;
		FileReader fl = new FileReader("/Users/sangwoo/Desktop/abc/cnt.txt");
		StringBuffer sb = new StringBuffer();
		while ((ch = fl.read()) != -1) {
			sb.append((char) ch);
		}
		String data = sb.toString().trim().replace("\n", "");
		fl.close();
		cnt = Integer.parseInt(data);
		cnt++;
		data = Integer.toString(cnt);
		FileWriter fl2 = new FileWriter("/Users/sangwoo/Desktop/abc/cnt.txt", false);
		fl2.write(data);
		fl2.close();
		int viewNum = Integer.parseInt(data);
		return viewNum;
	}
	
	@Override
	public List<Score> allView() throws IOException {
		List<Score> results = new ArrayList<>();

		try (Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/kopoctc", "root", "CJDghd9311@");
				Statement stmt = conn.createStatement();) {
				ResultSet rs = stmt.executeQuery("SELECT * FROM examtable4");
				
				while (rs.next()) {
					Score scoreItem = new Score();
					String name = rs.getString(1);
					int studentId = rs.getInt(2);
					int kor = rs.getInt(3);
					int eng = rs.getInt(4);
					int mat = rs.getInt(5);
					scoreItem.setName(name);
					scoreItem.setStudentid(studentId);
					scoreItem.setKor(kor);
					scoreItem.setEng(eng);
					scoreItem.setMat(mat);
					results.add(scoreItem);
			}


		} catch (SQLException e) {
			e.printStackTrace();
		}
		return results;
	}

}



//<%
//while (rset.next()) { 
//    out.println("<tr>");
//	 out.println("<td width=50><p align=center><a href='oneviewDB.jsp?key="		//각각의 값을가져오는데 이름을 누르면 onviewDB.jsp로 연결되어 1인만 조회하도록
//	 +rset.getString(1)+"'>"+rset.getString(1)+"</a></p></td>");
//	 out.println("<td width=50><p align=center>"+Integer.toString(rset.getInt(2))+"</p></td>");
//	 out.println("<td width=50><p align=center>"+Integer.toString(rset.getInt(3))+"</p></td>");
//	 out.println("<td width=50><p align=center>"+Integer.toString(rset.getInt(4))+"</p></td>");
//	 out.println("<td width=50><p align=center>"+Integer.toString(rset.getInt(5))+"</p></td>");
//	 out.println("<td width=50><p align=center>"+Integer.toString(rset.getInt(3) + rset.getInt(4) + rset.getInt(5))+"</p></td>");
//	 out.println("<td width=50><p align=center>"+Integer.toString((rset.getInt(3) + rset.getInt(4) + rset.getInt(5)) / 3)+"</p></td>");
//	 out.println("<td width=50><p align=center>"+Integer.toString(rset.getInt(6))+"</p></td>");
//	 out.println("<tr>");
//}
//out.println("</table>");
//out.println("<br><br><br>");
//out.println("<div style=" + "text-align:center" + ">");            //테이블 중간정렬
//if(from < 12 && it > 10){
//out.println("<a href=AllviewDB.jsp?from=1&cnt=10><FONT SIZE=6> << </FONT></a>");   //1~11페이지 상황에서는 <<버튼을 누르면 첫 페이지가 뜨도록
//} else if(it > 10){                                                   //그렇지 않은 상황에서는 <<버튼을 누르면 10페이지씩 줄어들도록
//out.println("<a href=AllviewDB.jsp?from=" + (from - 10) + "&cnt=10><FONT SIZE=6> << </FONT></a>");   
//}
//if(from < 5 && from <= it && howmany%10.0 != 0){                                                //현재페이지가 중간에 뜨고 양쪽에 5개씩 페이지를 띄울 것이므로
//for(int i = 1; i < it + 1; i++){                                 //5페이지 미만 상황에서는 무조건 1 ~ 10페이지를 띄운다
//out.println("<a href=AllviewDB.jsp?from=" + (i) + "&cnt=10><FONT SIZE=6>"+(i)+"</FONT></a>");   
//}
//} else if( from > 495 && from <= it){                                          //또한 마지막 페이지가 273페이지이므로 268페이지 이후로부턴 264~273페이지가 뜨도록
//for(int i =491; i < 501; i++){
//out.println("<a href=AllviewDB.jsp?from=" + (i) + "&cnt=10><FONT SIZE=6>"+(i)+"</FONT></a>");
//} 
//} else if( from == 5 && from <= it){                                          //else설정 하면 5페이지에서는 0페이지가 노출되니까 이를 막기 위해
//for(int i = from - 4; i < from + 6; i++){
//out.println("<a href=AllviewDB.jsp?from=" + (i) + "&cnt=10><FONT SIZE=6;>"+(i)+"</FONT></a>");   
//}
//} else if(howmany % 10.0 != 0){
//for(int i = from - 1; i < it + 2; i++){                        //그렇지 않은 상황에서는 왼쪽에 5개, 현재페이지, 오른쪽 4페이지가 뜨도록 한다.
// out.println("<a href=AllviewDB.jsp?from=" + (i) + "&cnt=10><FONT SIZE=6;>"+(i)+"</FONT></a>");   
//}
//}		//프롬은 몇페이지 보여줄꺼야? 0 1 2 3 4 5
//	//it은 총 페이지수 2 3 4 5
//if(from > 489 && from <= it){
//out.println("<a href=AllviewDB.jsp?from=273&cnt=10><FONT SIZE=6> >> </FONT></a>");//262페이지가 넘어가면 >>를 눌렀을 때 마지막 페이지까지 뜨도록
//} else if((from+10) <= it){
//out.println("<a href=AllviewDB.jsp?from=" + (from + 10) + "&cnt=10><FONT SIZE=6> >> </FONT></a>"); //그렇지 않은 일반상황에서는 >> 누르면 10페이지 증가하도록
//}
//out.println("<br>");
//
//rset.close(); 
//stmt.close(); 
//conn.close(); 
//%>
