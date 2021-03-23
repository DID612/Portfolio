package kr.green.testportfolio.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.testportfolio.vo.UserVo;

public interface UserDao {
	
	public String getEmail(@Param("id")String id);

	public void insertUser(@Param("user")UserVo user);

	public UserVo getUser(@Param("id")String id);

	public UserVo getUserById(@Param("id")String id);

	public UserVo updateUser(@Param("pw")String pw);

	public ArrayList<UserVo> getAllUser();

}
