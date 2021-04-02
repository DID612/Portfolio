package kr.green.testportfolio.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import kr.green.testportfolio.pagination.Criteria;
import kr.green.testportfolio.vo.CategoryVo;
import kr.green.testportfolio.vo.GoodsVo;

public interface GoodsService {

	ArrayList<CategoryVo> selectCategory();

	void insertCategory(CategoryVo category);

	void insertGoods(GoodsVo goods);

	ArrayList<GoodsVo> getListGoods(Criteria cri);

	int getGoodsTotalCount(Criteria cri);

	GoodsVo getGoodsDetail(int gNum);
}
