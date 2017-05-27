package com.marriage.dao.interfaces;

import com.marriage.model.User;

public interface IUserDAO {
	/**
	 * 登陆
	 * @param user
	 * @return
	 */
	public User login(User user);
	
	/**
	 * 注册
	 * @param user
	 * @return
	 */
	public Integer register(User user);
}
