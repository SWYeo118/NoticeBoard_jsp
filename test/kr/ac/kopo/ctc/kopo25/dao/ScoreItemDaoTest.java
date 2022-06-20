package kr.ac.kopo.ctc.kopo25.dao;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

import kr.ac.kopo.ctc.kopo25.domain.ScoreItem;

class ScoreItemDaoTest {
	
	private ScoreItemDao scoreItemDao = new ScoreItemDaoImpl();
	
	@Test
	void testCreate() {
		ScoreItem scoreItemInput = new ScoreItem();
		ScoreItem scoreItem = new ScoreItem();
		scoreItemInput.setId(1);
		scoreItemInput.setName("홍길동");
		scoreItemInput.setStudentId(1);
		scoreItemInput.setKor(100);
		scoreItemInput.setEng(95);
		scoreItemInput.setMat(80);
		
		
		ScoreItem scoreItemOutput = scoreItemDao.create(scoreItem);
		assertEquals(scoreItemOutput.getName(), "홍길동");
		assertEquals(scoreItemOutput.getId(), 1);
	}

}
