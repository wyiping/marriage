package com.marriage.servlets;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import com.marriage.common.PageControl;
import com.marriage.common.Pager;
import com.marriage.dao.impl.MessageDAO;
import com.marriage.dao.interfaces.IMessageDAO;
import com.marriage.model.Message;
import com.marriage.model.User;

public class MessageServlet extends HttpServlet {
	IMessageDAO dao = new MessageDAO();
	
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getParameter("cmd");
		if (cmd.equals("send")) {
			send(request, response);
		} else if (cmd.equals("sender")){
			sender(request,response);
		} else if (cmd.equals("receive")){
			receive(request,response);
		}
	}
	private void receive(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		User receiver = (User)session.getAttribute("user");
		PageControl pc = new PageControl();
		Integer currindex = 1;
		if (request.getParameter("index") != null) {
			currindex = Integer.parseInt(request.getParameter("index"));
		}
		pc.setCurrentindex(currindex);
		Pager<Message>  pager = dao.find_msg(receiver.getUserid(), pc);
		request.setAttribute("pager", pager);
		request.getRequestDispatcher("/receive.jsp").forward(request,response);
	}
	private void sender(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		User sender = (User)session.getAttribute("user");
		PageControl pc = new PageControl();
		Integer currindex = 1;
		if (request.getParameter("index") != null) {
			currindex = Integer.parseInt(request.getParameter("index"));
		}
		pc.setCurrentindex(currindex);
		Pager<Message>  pager = dao.find_send(sender.getUserid(), pc);
		request.setAttribute("pager", pager);
		request.getRequestDispatcher("/send.jsp").forward(request,response);
	}
	private void send(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		User sender = (User)session.getAttribute("user");
		Message msg = new Message();
		msg.setTime(new Date(System.currentTimeMillis()));
		msg.setSender(sender.getUserid());
		try {
			BeanUtils.populate(msg, request.getParameterMap());
			dao.send(msg);
			response.sendRedirect(request.getHeader("Referer"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}
}
