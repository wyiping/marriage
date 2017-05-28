/**
 * 
 */
package com.marriage.dao.impl;

import java.util.List;

import com.marriage.common.DBUnitHelper;
import com.marriage.common.PageControl;
import com.marriage.common.Pager;
import com.marriage.dao.interfaces.IAdminDAO;
import com.marriage.model.User;

public class AdminDAO implements IAdminDAO {

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.marriage.dao.interfaces.IAdminDAO#add(com.marriage.model.User)
	 */
	public Integer add(User user) {
		String sql = "insert into user(username,name,password,sex,height,birthday,detail,email,marital_situatio,role) values(?,?,?,?,?,?,?,?,?,?)";
		return DBUnitHelper.executeUpdate(sql, user.getUsername(),user.getName(), user
				.getPassword(), user.getSex(), user.getHeight(), user
				.getBirthday(), user.getDetail(), user.getEmail(), user
				.getMarital_situatio(),user.getRole());
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.marriage.dao.interfaces.IAdminDAO#delete(java.lang.Integer)
	 */
	public Integer delete(Integer id) {
		String sql = "delete from user where userid = ?";
		return DBUnitHelper.executeUpdate(sql,id);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.marriage.dao.interfaces.IAdminDAO#list(com.marriage.model.User,
	 * com.marriage.common.PageControl)
	 */
	public Pager<User> list(PageControl pc) {
		return DBUnitHelper.execlist("SELECT * FROM user", pc, User.class, "userid", null);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.marriage.dao.interfaces.IAdminDAO#login(com.marriage.model.User)
	 */
	public User login(User user) {
		String sql = "select * from user where username = ? and password = ? and role = 'admin'";
		List<User> list = DBUnitHelper.executeQuery(sql, User.class, user
				.getUsername(), user.getPassword());
		if (list.size() > 0) {
			user = list.get(0);
		} else {
			user = null;
		}
		return user;
	}

	public User find_one(Integer id) {
		String sql = "select * from user where userid = ?";
		List<User> list = DBUnitHelper.executeQuery(sql, User.class, id);
		if (list.size() > 0) {
			return list.get(0);
		} else {
			return null;
		}
	}

	public Integer update(User user) {
		String sql = "update user set" +
				" username=?,name=?,password=?,sex=?,height=?," +
				"birthday=?,email=?,detail=?,marital_situatio=?,role=?" +
				"where userid=?";
		return DBUnitHelper.executeUpdate(sql,user.getUsername(),user.getName(),user.getPassword(),user.getSex(),user.getHeight(),
				user.getBirthday(),user.getEmail(),user.getDetail(),user.getMarital_situatio(),user.getRole(),user.getUserid());
	}
}
