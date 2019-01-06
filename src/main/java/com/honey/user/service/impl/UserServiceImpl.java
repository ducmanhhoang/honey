package com.honey.user.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.honey.user.service.User;
import com.honey.user.service.UserService;

@Service(value="userService")
public class UserServiceImpl implements UserService {

	@Resource(name="userDAO")
	private UserDAO userDAO;
	
	@Override
	public void insertUser(User user) throws Exception {
		userDAO.insertUser(user);
	}

	@Override
	public List<User> selectUserList(User user) throws Exception {
		return userDAO.selectUserList(user);
	}

	@Override
	public int selectUserListPagingTotCount(User user) throws Exception {
		return userDAO.selectUserListPagingTotCount(user);
	}

	@Override
	public List<User> selectUserListPaging(User user) throws Exception {
		return userDAO.selectUserListPaging(user);
	}

	@Override
	public void updateUser(User user) throws Exception {
		userDAO.updateUser(user);
	}

}
