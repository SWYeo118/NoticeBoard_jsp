package kr.ac.kopo.ctc.kopo25.service;

import java.util.List;

import kr.ac.kopo.ctc.kopo25.dao.ScoreItemDao;
import kr.ac.kopo.ctc.kopo25.domain.ScoreItem;
import kr.ac.kopo.ctc.kopo25.dto.Pagination;

public interface ScoreItemService {
	ScoreItem selectOne(int id);
	List<ScoreItem> selectAll(int page, int countPerPage);
	Pagination getPagination(int currPage, int countPerPage, int pageSize, int totalCount);
	ScoreItemDao getScoreItemDao();
	void setScoreItemDao(ScoreItemDao scoreItemDao);
	
//	public int add(int a, int b) {
//		return a + b;
//	}
//	
//	public List<ScoreItem> selectAll(in)
}
