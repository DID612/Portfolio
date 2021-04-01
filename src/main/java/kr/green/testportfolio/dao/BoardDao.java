package kr.green.testportfolio.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.green.testportfolio.pagination.Criteria;
import kr.green.testportfolio.vo.BoardVo;
import kr.green.testportfolio.vo.CategoryVo;
import kr.green.testportfolio.vo.GoodsVo;

public interface BoardDao {

	BoardVo getDetail(@Param("bNum")int bNum);

	void updateDetail(@Param("board")BoardVo board);

	void insertBoard(@Param("board")BoardVo board);

	void deleteBoard(@Param("bNum")int bNum);

	ArrayList<BoardVo> getBoard(@Param("cri")Criteria cri);

	int getTotalCount(@Param("cri")Criteria cri);

	ArrayList<CategoryVo> selectCategory();

	void insertCategory(@Param("category")CategoryVo category);

	void insertGoods(@Param("goods")GoodsVo goods);

	ArrayList<GoodsVo> selectGoodsList(@Param("cri")Criteria cri);

	int getGoodsTotalCount(@Param("cri")Criteria cri);

}
		