package kr.ac.kopo.ctc.kopo25.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.ctc.kopo25.domain.ScoreItem;

public class ScoreItemDaoImpl implements ScoreItemDao {

	public ScoreItemDaoImpl() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // jdbc Driver에 연결
		} catch (ClassNotFoundException e) {
			throw new IllegalStateException("jdbc 드라이버 로드 실패"); // 연결 실패 시 에러메세지
		}
	}

	@Override
	public ScoreItem getOne(int studentid) {
		ScoreItem scoreItem = new ScoreItem();
		String sql = "SELECT * FROM examtable4 where studentid=?"; // sql문
		try (Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/kopoctc", "root",
				""); PreparedStatement stmt = conn.prepareStatement(sql);) {
			stmt.setInt(1, studentid);
			try (ResultSet rs = stmt.executeQuery();) {
				rs.next();
				scoreItem.setName(rs.getString("name"));
				scoreItem.setStudentId(rs.getInt("studentid"));
				scoreItem.setKor(rs.getInt("kor"));
				scoreItem.setEng(rs.getInt("eng"));
				scoreItem.setMat(rs.getInt("mat"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			// throw new IllegalStateException("db연결 실패" + e.getMessage());
		}
		return scoreItem;
	}

	@Override
	public List<ScoreItem> selectAll(int page, int countPerPage) {
		List<ScoreItem> results = new ArrayList<>();

		String sql = "SELECT * FROM examtable4";
		try (Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/kopoctc", "root", "");
				Statement stmt = conn.createStatement();) {
			try (ResultSet rs = stmt.executeQuery(sql)) {
				while (rs.next()) {
					String name = rs.getString(1);
					int studentId = rs.getInt(2);
					int kor = rs.getInt(3);
					int eng = rs.getInt(4);
					int mat = rs.getInt(5);

					ScoreItem scoreItem = new ScoreItem();
					scoreItem.setName(name);
					scoreItem.setStudentId(studentId);
					scoreItem.setKor(kor);
					scoreItem.setEng(eng);
					scoreItem.setMat(mat);

					results.add(scoreItem);
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
//			throw new IllegalStateException("db 연결 실패");
		}

		return results;
	}
	
	
	@Override
	public int getTotalCount() {
		int num = 0;
		String sql = "SELECT count(*) FROM examtable4"; // sql문
		try (Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/kopoctc", "root",
				""); Statement stmt = conn.createStatement();) {
			ResultSet rs = stmt.executeQuery(sql); // ResultSet에 가져온 데이터 저장.
			rs.next();
			num = rs.getInt(1);
		} catch (SQLException e) {
			throw new IllegalStateException("db연결 실패" + e.getMessage());
		}
		return num;
	}

	@Override
	public void insert(ScoreItem scoreItems) {
		// PreparedStatement를 쓰면 여러번 지우고 쓸 때 빠르다.
		// 동적 쿼리 생성
		String sql = "INSERT INTO examtable4 VALUES (?, ?, ?, ?, ?)";
		try (Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/kopoctc", "root",
				""); PreparedStatement stmt = conn.prepareStatement(sql);) {
			stmt.setString(1, scoreItems.getName());
			stmt.setInt(2, scoreItems.getStudentId());
			stmt.setInt(3, scoreItems.getKor());
			stmt.setInt(4, scoreItems.getEng());
			stmt.setInt(5, scoreItems.getMat());
			// execute가 아니라 executeUpdate 쓰면 결과를 리턴받는다.
			stmt.executeUpdate();
		} catch (SQLException e) {
			throw new IllegalStateException("insert 실패" + e.getMessage());
		}
	}

	@Override
	public void update(ScoreItem scoreItems) {
		String sql = "UPDATE examtable4 SET name=?, kor=?, eng=?, mat=? where studentid=?";
		try (Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/kopoctc", "root",
				""); PreparedStatement stmt = conn.prepareStatement(sql);) {
			stmt.setString(1, scoreItems.getName());
			stmt.setInt(2, scoreItems.getKor());
			stmt.setInt(3, scoreItems.getEng());
			stmt.setInt(4, scoreItems.getMat());
			stmt.setInt(5, scoreItems.getStudentId());
			// execute가 아니라 executeUpdate 쓰면 결과를 리턴받는다.
			stmt.executeUpdate();
		} catch (SQLException e) {
			throw new IllegalStateException("insert 실패" + e.getMessage());
		}

	}

	@Override
	public void delete(int studentid) {
		String sql = "DELETE FROM examtable4 WHERE studentid=?";
		try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kopoctc", "root",
				""); PreparedStatement stmt = conn.prepareStatement(sql);) {
			stmt.setInt(1, studentid);
			// 0보다 크면 insert 됨
			stmt.executeUpdate();
		} catch (SQLException e) {
			throw new IllegalStateException("delete 실패 " + e.getMessage());
		}
	}

}
