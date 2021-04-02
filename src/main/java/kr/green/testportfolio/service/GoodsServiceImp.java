package kr.green.testportfolio.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.testportfolio.dao.GoodsDao;
import kr.green.testportfolio.pagination.Criteria;
import kr.green.testportfolio.vo.CategoryVo;
import kr.green.testportfolio.vo.GoodsVo;

@Service
public class GoodsServiceImp implements GoodsService {
	@Autowired
	GoodsDao goodsDao;
	
	@Override
	public ArrayList<CategoryVo> selectCategory() {
		return goodsDao.selectCategory();
	}

	@Override
	public void insertCategory(CategoryVo category) {
		goodsDao.insertCategory(category);

	}

	@Override
	public void insertGoods(GoodsVo goods) {
		goodsDao.insertGoods(goods);

	}

	@Override
	public ArrayList<GoodsVo> getListGoods(Criteria cri) {
		return goodsDao.selectGoodsList(cri);
	}

	@Override
	public int getGoodsTotalCount(Criteria cri) {
		return goodsDao.getGoodsTotalCount(cri);
	}

	@Override
	public GoodsVo getGoodsDetail(int gNum) {
		return goodsDao.selectGoodsDetail(gNum);
	}

}
