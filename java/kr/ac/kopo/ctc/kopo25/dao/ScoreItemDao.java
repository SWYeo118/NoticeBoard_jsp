package kr.ac.kopo.ctc.kopo25.dao;

import java.util.List;

import kr.ac.kopo.ctc.kopo25.domain.ScoreItem;

public interface ScoreItemDao {
	void insert(ScoreItem scoreItems);
	void update(ScoreItem scoreItems);
	ScoreItem getOne(int studentid);
	void delete(int studentid);
	int getTotalCount();
	List<ScoreItem> selectAll(int page, int countPerPage);

	
}
