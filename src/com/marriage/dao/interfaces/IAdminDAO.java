package com.marriage.dao.interfaces;

import com.marriage.common.PageControl;
import com.marriage.common.Pager;
import com.marriage.model.User;

public interface IAdminDAO {
	/**
	 * 登陆
	 * @param user
	 * @return User
	 */
	public User login(User user);
	
	/**
	 * 添加用户
	 * @param user
	 * @return
	 */
	public Integer add(User user);
	
	/**
	 * 删除用户
	 * @param userid
	 * @return status
	 */
	public Integer delete(Integer id);
	
	/**
	 * 用户列表
	 * @return list
	 */
	public Pager<User> list(PageControl pc);
	
	/**
	 * 查询一个用户
	 * @param userid
	 * @return User
	 */
	public User find_one(Integer id);
	
	/**
	 * 更新用户
	 * @param user
	 * @return status
	 */
	public Integer update(User user);
}
