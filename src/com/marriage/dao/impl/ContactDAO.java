package com.marriage.dao.impl;

import com.marriage.common.DBUnitHelper;
import com.marriage.dao.interfaces.IContactDAO;
import com.marriage.model.Contact;

public class ContactDAO implements IContactDAO {

	public Integer send(Contact contact) {
		String sql = "insert into contact(name,email,phone,message) value(?,?,?,?)";
		return DBUnitHelper.executeUpdate(sql,contact.getName(),contact.getEmail(),contact.getPhone(),contact.getMessage());
	}
}
