package kr.ac.kopo.ctc.kopo25.service;

import java.io.IOException;
import java.util.List;

import kr.ac.kopo.ctc.kopo25.dto.Pagination;
import kr.ac.kopo.ctc.kopo25.dto.Score;

public interface ScoreItemService {
	Pagination getPagination(int currPage, int countPerPage, int pageSize, int totalCount);
	public int retunViewNum() throws IOException;
	public List<Score> allView() throws IOException;
	int getTotalCount();
}
