package com.marriage.dao.impl;

import java.util.List;

import com.marriage.common.DBUnitHelper;

import com.marriage.dao.interfaces.IUserDAO;
import com.marriage.model.User;

public class UserDAO implements IUserDAO {

	public User login(User user) {
		String sql = "select * from user where username = ? and password = ?";
		List<User> list = DBUnitHelper.executeQuery(sql, User.class, user
				.getUsername(), user.getPassword());
		if (list.size() > 0) {
			user = list.get(0);
		} else {
			user = null;
		}
		return user;
	}

	public Integer register(User user) {
		String sql = "insert into user(username,password,sex,height,birthday,detail,email,marital_situatio,role) values(?,?,?,?,?,?,?,?,'user')";
		return DBUnitHelper.executeUpdate(sql, user.getUsername(), user
				.getPassword(), user.getSex(), user.getHeight(), user
				.getBirthday(), user.getDetail(), user.getEmail(), user
				.getMarital_situatio());
	}
}
