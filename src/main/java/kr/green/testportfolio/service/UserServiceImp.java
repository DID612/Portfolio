package kr.green.testportfolio.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.testportfolio.dao.UserDao;
import kr.green.testportfolio.vo.UserVo;
@Service
public class UserServiceImp implements UserService{
	
	@Autowired
	UserDao userDao;
	
	@Override
	public String getEmail(String id) {
		return userDao.getEmail(id);
	}

	@Override
	public void insertUser(UserVo user) {
		userDao.insertUser(user);
	}

	@Override
	public UserVo getUser(String id) {	
		return userDao.getUser(id);
	}

	@Override
	public UserVo getUserById(String id) {
		return userDao.getUserById(id);
	}

	@Override
	public UserVo updateUser(String pw) {
		return userDao.updateUser(pw);
	}

	@Override
	public ArrayList<UserVo> getAllUser() {
		return userDao.getAllUser();
	}
}
