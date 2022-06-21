package kr.ac.kopo.ctc.kopo25.service;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import kr.ac.kopo.ctc.kopo25.dto.Pagination;

class ScoreItemServiceTest {
	// ScoreItemDaoImpl은 DB에 연결된 애니까 얘를 사용할 필요 없이 ScoreItemDaoMock이라는 가짜 데이터를 사용하자
//	private ScoreItemDao scoreItemDao = new ScoreItemDaoMock();
	private ScoreItemService scoreItemService = new ScoreItemServiceImpl();
	
	@BeforeEach
//	void setUp() throws Exception {
//		scoreItemService.setScoreItemDao(scoreItemDao);
//	}

	@AfterEach
	void tearDown() throws Exception {
	}
	
	
	@Test
	void testGetPagenation1() {						// 현재페이지curr, 쪽당 페이지countPPage, 페이지당 게시글수pageSize, 총 게시글totalCount 
		Pagination pagenation = scoreItemService.getPagination(1, 15, 50, 1025);
		assertEquals(1, pagenation.getPpPage());	// 무조건 1
		assertEquals(1, pagenation.getpPage());		// 이전 쪽
		assertEquals(16, pagenation.getnPage());	// 다음 쪽
		assertEquals(21, pagenation.getNnPage());	// 무조건 lastPage
		assertEquals(1, pagenation.getcPage());		// 현재 페이지
	}
	
	@Test
	void testGetPagenation2() {						// 현재페이지curr, 쪽당 페이지countPPage, 페이지당 게시글수pageSize, 총 게시글totalCount 
		Pagination pagenation = scoreItemService.getPagination(-100, 15, 50, 1025);
		assertEquals(1, pagenation.getPpPage());	// 무조건 1
		assertEquals(1, pagenation.getpPage());		// 이전 쪽
		assertEquals(16, pagenation.getnPage());	// 다음 쪽
		assertEquals(21, pagenation.getNnPage());	// 무조건 lastPage
		assertEquals(1, pagenation.getcPage());		// 현재 페이지
	}
	
	@Test
	   void testGetPagination3() {
	      Pagination pagination = scoreItemService.getPagination(3, 10, 10, 58);
	      assertEquals(1, pagination.getPpPage());
	      assertEquals(1, pagination.getpPage());
	      assertEquals(6, pagination.getnPage());
	      assertEquals(6, pagination.getNnPage());
	      assertEquals(3, pagination.getcPage());
	   }
	   
	   @Test
	   void testGetPagination4() {
	      Pagination pagination = scoreItemService.getPagination(-100, 15, 20, 1025);
	      assertEquals(1, pagination.getPpPage());
	      assertEquals(1, pagination.getpPage());
	      assertEquals(16, pagination.getnPage());
	      assertEquals(52, pagination.getNnPage());
	      assertEquals(1, pagination.getcPage());
	   }
	   
	   @Test
	   void testGetPagination5() {
	      Pagination pagination = scoreItemService.getPagination(17, 10, 10, 351);
	      assertEquals(1, pagination.getPpPage());
	      assertEquals(1, pagination.getpPage());
	      assertEquals(21, pagination.getnPage());
	      assertEquals(36, pagination.getNnPage());
	      assertEquals(17, pagination.getcPage());
	   }
	   
	   @Test
	   void testGetPagination6() {
	      Pagination pagination = scoreItemService.getPagination(1, 10, 10, 1025);
	      assertEquals(1, pagination.getPpPage());
	      assertEquals(1, pagination.getpPage());
	      assertEquals(11, pagination.getnPage());
	      assertEquals(103, pagination.getNnPage());
	      assertEquals(1, pagination.getcPage());
	   }
	   
	   @Test
	   void testGetPagination7() {
	      Pagination pagination = scoreItemService.getPagination(-100, 10, 10, 1025);
	      assertEquals(1, pagination.getPpPage());
	      assertEquals(1, pagination.getpPage());
	      assertEquals(11, pagination.getnPage());
	      assertEquals(103, pagination.getNnPage());
	      assertEquals(1, pagination.getcPage());
	   }
	
	   @Test
	   void testGetPagination8() {
	      Pagination pagination = scoreItemService.getPagination(1000, 10, 10, 1025);
	      assertEquals(1, pagination.getPpPage());
	      assertEquals(91, pagination.getpPage());
	      assertEquals(103, pagination.getnPage());
	      assertEquals(103, pagination.getNnPage());
	      assertEquals(103, pagination.getcPage());
	   }
	   
	   
	   @Test
	   void testGetPagination9() {
	      Pagination pagination = scoreItemService.getPagination(1, 10, 10, 1000);
	      assertEquals(1, pagination.getPpPage());
	      assertEquals(1, pagination.getpPage());
	      assertEquals(11, pagination.getnPage());
	      assertEquals(100, pagination.getNnPage());
	      assertEquals(1, pagination.getcPage());
	   }
	   
	   @Test
	   void testGetPagination10() {
	      Pagination pagination = scoreItemService.getPagination(-100, 10, 10, 1000);
	      assertEquals(1, pagination.getPpPage());
	      assertEquals(1, pagination.getpPage());
	      assertEquals(11, pagination.getnPage());
	      assertEquals(100, pagination.getNnPage());
	      assertEquals(1, pagination.getcPage());
	   }
	   

	   
	   @Test
	   void testGetPagination11() {
	      Pagination pagination = scoreItemService.getPagination(1000, 10, 10, 1000);
	      assertEquals(1, pagination.getPpPage());
	      assertEquals(91, pagination.getpPage());
	      assertEquals(100, pagination.getnPage());
	      assertEquals(100, pagination.getNnPage());
	      assertEquals(100, pagination.getcPage());
	   }
	   
	   @Test
	   void testGetPagination12() {
	      Pagination pagination = scoreItemService.getPagination(1, 10, 10, 50);
	      assertEquals(1, pagination.getPpPage());
	      assertEquals(1, pagination.getpPage());
	      assertEquals(5, pagination.getnPage());
	      assertEquals(5, pagination.getNnPage());
	      assertEquals(1, pagination.getcPage());
	   }
	   
	   @Test
	   void testGetPagination13() {
	      Pagination pagination = scoreItemService.getPagination(6, 10, 10, 50);
	      assertEquals(1, pagination.getPpPage());
	      assertEquals(1, pagination.getpPage());
	      assertEquals(5, pagination.getnPage());
	      assertEquals(5, pagination.getNnPage());
	      assertEquals(5, pagination.getcPage());
	   }

	   
	


//	public ScoreItemDao getScoreItemDao() {
//		return scoreItemDao;
//	}
//
//
//
//	public void setScoreItemDao(ScoreItemDao scoreItemDao) {
//		this.scoreItemDao = scoreItemDao;
//	}

}
