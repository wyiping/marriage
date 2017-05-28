package com.marriage.dao.interfaces;

import java.util.List;

import com.marriage.common.PageControl;
import com.marriage.common.Pager;
import com.marriage.model.Message;

public interface IMessageDAO {
	/**
	 * 发送消息
	 * @param msg
	 * @return 
	 */
	public Integer send(Message msg);
	
	/**
	 * 查看消息
	 * @param receiveID
	 * @return Message
	 */
	public Pager<Message> find_msg(Integer id,PageControl pc);
	
	/**
	 * 查看发送的消息
	 * @param senderID
	 * @return
	 */
	public Pager<Message> find_send(Integer id,PageControl pc);
}
