package com.marriage.dao.interfaces;

import java.util.List;

import com.marriage.common.PageControl;
import com.marriage.common.Pager;
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
	
	/**
	 * 编辑
	 * @param user
	 * @return
	 */
	public Integer edit(User user);
	
	/**
	 * 编辑头像
	 * @param user
	 * @return
	 */
	public Integer avatar(User user);
	
	/**
	 * 查询用户
	 * @return List<User>
	 */
	public List<User> find();
	
	/**
	 * 查询用户
	 * @param User 
	 * @return List<User>
	 */
	public List<User> search(User user);
	
	/**
	 * 查询一个用户
	 * @param userid
	 * @return User
	 */
	public User find_one(Integer id);
	
	/**
	 * 会员列表
	 * @return list
	 */
	public Pager<User> members(PageControl pc);
}
