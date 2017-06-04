package com.marriage.dao.interfaces;

import com.marriage.model.Contact;
public interface IContactDAO {
	/**
	 * 发送留言
	 * @param msg
	 * @return 
	 */
	public Integer send(Contact contact);
}
