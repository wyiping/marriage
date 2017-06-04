package com.marriage.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import com.marriage.common.PageControl;
import com.marriage.common.Pager;
import com.marriage.common.Tools;
import com.marriage.dao.impl.ContactDAO;
import com.marriage.dao.impl.UserDAO;
import com.marriage.dao.interfaces.IContactDAO;
import com.marriage.dao.interfaces.IUserDAO;
import com.marriage.model.Contact;
import com.marriage.model.User;

public class HomeServlet extends HttpServlet {
	IUserDAO dao = new UserDAO();
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getParameter("cmd");
		System.out.print(cmd);
		if (cmd == null){
			initpage(request, response);
		} else if(cmd.equals("search.jsp")){
			request.setAttribute("users", dao.find());
			request.getRequestDispatcher("/search.jsp").forward(request,response);
		} else if (cmd.equals("search")){
			search(request, response);
		} else if (cmd.equals("members")){
			members(request, response);
		} else if (cmd.equals("profile")){
			request.setAttribute("u", dao.find_one(Integer.parseInt(request.getParameter("id"))));
			request.setAttribute("visited", dao.find());
			request.getRequestDispatcher("/profile.jsp").forward(request,response);
		} else if (cmd.equals("contact")){
			contact(request, response);
		}
	}
	
	/**
	 * 初始化主页
	 * @param request
	 * @param response
	 */
	private void initpage(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("users", dao.find());
		try {
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private void search(HttpServletRequest request, HttpServletResponse response) {
		User user = new User();
		try {
			BeanUtils.populate(user, request.getParameterMap());
			request.setAttribute("users", dao.search(user));
			request.getRequestDispatcher("/matches.jsp").forward(request,response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private void members(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		PageControl pc = new PageControl();
		Integer currindex = 1;
		if (request.getParameter("index") != null) {
			currindex = Integer.parseInt(request.getParameter("index"));
		}
		pc.setCurrentindex(currindex);
		Pager<User> pager = dao.members(pc);
		request.setAttribute("pager", pager);
		request.getRequestDispatcher("/members.jsp").forward(request,
				response);
	}
	
	private void contact(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.print("tset");
		IContactDAO cdao = new ContactDAO();
		Contact con = new Contact();
		try {
			BeanUtils.populate(con, request.getParameterMap());
			cdao.send(con);
			request.setAttribute("msg", "提交成功！");
			response.sendRedirect(request.getHeader("Referer"));
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
}
