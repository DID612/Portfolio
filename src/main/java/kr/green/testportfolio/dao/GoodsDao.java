package kr.green.testportfolio.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.testportfolio.pagination.Criteria;
import kr.green.testportfolio.vo.CategoryVo;
import kr.green.testportfolio.vo.GoodsVo;

public interface GoodsDao {

	ArrayList<CategoryVo> selectCategory();

	void insertCategory(@Param("category")CategoryVo category);

	void insertGoods(@Param("goods")GoodsVo goods);

	ArrayList<GoodsVo> selectGoodsList(@Param("cri")Criteria cri);

	int getGoodsTotalCount(@Param("cri")Criteria cri);

	GoodsVo selectGoodsDetail(int gNum);
}
