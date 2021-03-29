package kr.green.testportfolio.service;

import java.util.ArrayList;

import kr.green.testportfolio.pagination.Criteria;
import kr.green.testportfolio.vo.BoardVo;
import kr.green.testportfolio.vo.CategoryVo;
import kr.green.testportfolio.vo.GoodsVo;

public interface BoardService {

	BoardVo getDetail(int bNum);

	void updateDetail(BoardVo board);

	void insertBoard(BoardVo board);

	void deleteBoard(int bNum);

	ArrayList<BoardVo> getBoard(Criteria cri);

	int getTotalCount(Criteria cri);

	ArrayList<CategoryVo> selectCategory();

	void insertCategory(CategoryVo category);

	void insertGoods(GoodsVo goods);
	
}
