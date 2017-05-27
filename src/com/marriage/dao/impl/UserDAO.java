package com.marriage.dao.impl;

import java.util.List;

import com.marriage.common.DBUnitHelper;
import com.marriage.common.PageControl;
import com.marriage.common.Pager;

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
	
	public Integer edit(User user) {
		String sql = "update user set" +
				" username=?,password=?,sex=?,height=?," +
				"birthday=?,email=?,detail=?,marital_situatio=? " +
				"where userid=?";
		return DBUnitHelper.executeUpdate(sql,user.getUsername(),user.getPassword(),user.getSex(),user.getHeight(),
				user.getBirthday(),user.getEmail(),user.getDetail(),user.getMarital_situatio(),user.getUserid());
	}
	
	public List<User> find() {
		String sql = "select *, "+
			"(year(now())-year(birthday)-1) + ( DATE_FORMAT(birthday, '%m%d') <= DATE_FORMAT(NOW(), '%m%d') ) as age "+
			"from user";
		return DBUnitHelper.executeQuery(sql, User.class);
	}
	
	public List<User> search(User user){
		String sql = "SELECT *, "+
			"(year(now())-year(birthday)-1) + ( DATE_FORMAT(birthday, '%m%d') <= DATE_FORMAT(NOW(), '%m%d') ) as age "+
			"FROM user WHERE "+
			"sex LIKE ? AND "+
			"height > ? AND "+
			"marital_situatio = ? AND "+
			"(year(now())-year(birthday)-1) + ( DATE_FORMAT(birthday, '%m%d') <= DATE_FORMAT(NOW(), '%m%d') ) > ? ";
		return DBUnitHelper.executeQuery(sql, User.class, user.getSex(), user.getHeight(), user.getMarital_situatio(),user.getAge());
	}

	public Pager<User> members(PageControl pc) {
		String sql = "SELECT *, "+
			"(year(now())-year(birthday)-1) + ( DATE_FORMAT(birthday, '%m%d') <= DATE_FORMAT(NOW(), '%m%d') ) as age "+
			"FROM user";
		return DBUnitHelper.execlist(sql, pc, User.class, "userid", null);
	}
	
	public User find_one(Integer id) {
		String sql = "select *, "+
		"(year(now())-year(birthday)-1) + ( DATE_FORMAT(birthday, '%m%d') <= DATE_FORMAT(NOW(), '%m%d') ) as age "+
		"from user where userid = ?";
		List<User> list = DBUnitHelper.executeQuery(sql, User.class, id);
		if (list.size() > 0) {
			return list.get(0);
		} else {
			return null;
		}
	}

	public Integer avatar(User user) {
		String sql = "update user set " +
			"avatar = ? where userid = ?";
		return DBUnitHelper.executeUpdate(sql,user.getAvatar(),user.getUserid());
	}
}
