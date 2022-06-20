package kr.ac.kopo.ctc.kopo25.dao;

import java.util.List;

import kr.ac.kopo.ctc.kopo25.domain.ScoreItem;

public interface ScoreItemDao {
	ScoreItem create(ScoreItem scoreItem);
	ScoreItem selectOne(int id);
	List<ScoreItem> selectAll(int page, int countPerPage);
//	read
//	update
//	delete
}
