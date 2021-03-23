package kr.green.testportfolio.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.green.testportfolio.pagination.Criteria;
import kr.green.testportfolio.vo.BoardVo;

public interface BoardDao {

	BoardVo getDetail(@Param("bNum")int bNum);

	void updateDetail(@Param("board")BoardVo board);

	void insertBoard(@Param("board")BoardVo board);

	void deleteBoard(@Param("bNum")int bNum);

	ArrayList<BoardVo> getBoard(@Param("cri")Criteria cri);

	int getTotalCount(@Param("cri")Criteria cri);

}
		