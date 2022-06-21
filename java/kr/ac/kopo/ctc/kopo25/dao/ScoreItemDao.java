package kr.ac.kopo.ctc.kopo25.dao;

import kr.ac.kopo.ctc.kopo25.domain.ScoreItem;

public interface ScoreItemDao {
	void insert(ScoreItem scoreItems);
	void update(ScoreItem scoreItems);
	void delete(ScoreItem scoreItems);
	int getAll();
	ScoreItem create(ScoreItem scoreItem);
	ScoreItem getOne(int studentid);
	void delete(int studentid);

	
}
