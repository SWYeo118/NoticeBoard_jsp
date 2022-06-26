package kr.ac.kopo.ctc.kopo25.dao;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

import kr.ac.kopo.ctc.kopo25.domain.ScoreItem;

class ScoreItemDaoTest {
	// ScoreItemDao는 Interface, ScoreItemDaoImpl은 그 Interface의 Implements
	// ScoreItem은 Getter와 Setter가 있음
	private ScoreItemDao scoreItemDao = new ScoreItemDaoImpl();

	@Test
	void testCreate() {
		ScoreItem scoreItemInsert = new ScoreItem();
		scoreItemInsert.setName("여상우");
		scoreItemInsert.setStudentId(1);
		scoreItemInsert.setKor(100);
		scoreItemInsert.setEng(95);
		scoreItemInsert.setMat(88);
		scoreItemDao.insert(scoreItemInsert);
	}

	@Test
	void testRead() {
		ScoreItem scoreItemOutput = scoreItemDao.getOne(1);
		int scoreItemOutputAll = scoreItemDao.getTotalCount();
		assertEquals(1, scoreItemOutput.getStudentId());
		assertEquals("여상우", scoreItemOutput.getName());
		assertEquals(100, scoreItemOutput.getKor());
		assertEquals(95, scoreItemOutput.getEng());
		assertEquals(88, scoreItemOutput.getMat());
		assertEquals(10, scoreItemOutputAll);
	}
	
	@Test
	void testUpdate() {
		ScoreItem a = scoreItemDao.getOne(1);
		a.setName("여상우우");
		a.setKor(10);
		a.setEng(91);
		a.setMat(84);
		scoreItemDao.update(a);
		ScoreItem scoreItemUpdate = scoreItemDao.getOne(1);
		assertEquals(1, scoreItemUpdate.getStudentId());
		assertEquals("여상우우", scoreItemUpdate.getName());
		assertEquals(10, scoreItemUpdate.getKor());
		assertEquals(91, scoreItemUpdate.getEng());
		assertEquals(84, scoreItemUpdate.getMat());

	}

//	@Test
//	void testDelete() {
//		scoreItemDao.delete(1);
//		int scoreItemOutputAll = scoreItemDao.selectAll();
//		assertEquals(9, scoreItemOutputAll);
//	}
}