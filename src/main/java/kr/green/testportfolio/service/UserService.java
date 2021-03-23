package kr.green.testportfolio.service;

import java.util.ArrayList;

import kr.green.testportfolio.vo.UserVo;

public interface UserService {
	String getEmail(String id);

	void insertUser(UserVo user);

	UserVo getUser(String string);

	UserVo getUserById(String id);

	UserVo updateUser(String pw);

	ArrayList<UserVo> getAllUser();;
}
