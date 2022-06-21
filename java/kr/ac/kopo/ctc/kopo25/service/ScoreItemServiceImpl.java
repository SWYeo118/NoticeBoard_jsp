package kr.ac.kopo.ctc.kopo25.service;

import java.util.List;

import kr.ac.kopo.ctc.kopo25.dao.ScoreItemDao;
import kr.ac.kopo.ctc.kopo25.domain.ScoreItem;
import kr.ac.kopo.ctc.kopo25.dto.Pagination;

public class ScoreItemServiceImpl implements ScoreItemService {
	private ScoreItemDao scoreItemDao;

	public ScoreItemDao getScoreItemDao() {
		return scoreItemDao;
	}

	public void setScoreItemDao(ScoreItemDao scoreItemDao) {
		this.scoreItemDao = scoreItemDao;
	}

	@Override
	public ScoreItem create(ScoreItem scoreItem) {
		return scoreItemDao.create(scoreItem);
	}

	@Override
	public ScoreItem selectOne(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ScoreItem> selectAll(int page, int countPerPage) {
		// TODO Auto-generated method stub
		return null;
	}

	// 첫, 중간, 끝, 왼쪽오버, 오른쪽오버 10개 테스트
	// 10페이지씩 한다고 생각했을 때 1 ~ 10페이지에서 오른쪽 누르면 11페이지, 11 ~ 20에서 왼쪽 누르면 1페이지가 뜬다.
	// 9에서 눌러도 11, 3에서 눌러도 11 . 13에서 눌러도 1 19에서 눌러도 1
	@Override // 현재페이지curr, 쪽당 페이지countPPage, 페이지당 게시글수pageSize, 총 게시글totalCount
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
}
