package kr.green.testportfolio.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.testportfolio.dao.BoardDao;
import kr.green.testportfolio.pagination.Criteria;
import kr.green.testportfolio.vo.BoardVo;
import kr.green.testportfolio.vo.CategoryVo;
import kr.green.testportfolio.vo.GoodsVo;

@Service
public class BoardServiceImp implements BoardService {

	@Autowired
	BoardDao boardDao;

	@Override
	public BoardVo getDetail(int bNum) {
		return boardDao.getDetail(bNum);
	}

	@Override
	public void updateDetail(BoardVo board) {
		boardDao.updateDetail(board);
		return;
	}

	@Override
	public void insertBoard(BoardVo board) {
		boardDao.insertBoard(board);
	}

	@Override
	public void deleteBoard(int bNum) {
		boardDao.deleteBoard(bNum);		
	}

	@Override
	public ArrayList<BoardVo> getBoard(Criteria cri) {
		return boardDao.getBoard(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		return boardDao.getTotalCount(cri);
	}

	@Override
	public ArrayList<CategoryVo> selectCategory() {
		return boardDao.selectCategory();
	}

	@Override
	public void insertCategory(CategoryVo category) {
		boardDao.insertCategory(category);
		
	}

	@Override
	public void insertGoods(GoodsVo goods) {
		boardDao.insertGoods(goods);
		
	}
	
}
