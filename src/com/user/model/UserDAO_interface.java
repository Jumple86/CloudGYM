package com.user.model;

import java.util.List;

public interface UserDAO_interface {
	void insert(UserVO userVO);
	void update(UserVO userVO);
	void delete(Integer userID);
	UserVO findByUserId(Integer userID);
	List<UserVO> getAll();
}
