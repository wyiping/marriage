package com.marriage.servlets;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import com.marriage.common.Tools;

import com.marriage.dao.impl.UserDAO;
import com.marriage.dao.interfaces.IUserDAO;
import com.marriage.model.User;

public class UserServlet extends HttpServlet {
	IUserDAO dao = new UserDAO();

	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getParameter("cmd");
		System.out.println(cmd);
		if (cmd.equals("login")) {
			login(request, response);
		} else if (cmd.equals("register")) {
			register(request, response);
		} else if (cmd.equals("logout")){
			logout(request,response);
		}
	}

	private void register(HttpServletRequest request,
			HttpServletResponse response) {
		User user = new User();
		try {
			BeanUtils.populate(user, request.getParameterMap());
			Integer rtn = dao.register(user);
			if (rtn > 0) {
				response.sendRedirect(Tools.Basepath(request, response)
						+ "login.jsp");
			} else {
				request.setAttribute("msg", "添加用户失败或请不要再重复添加");
				request.getRequestDispatcher("/register.jsp").forward(request,
						response);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void login(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		User user = new User();
		user.setUsername(request.getParameter("username"));
		user.setPassword(request.getParameter("password"));
		user = dao.login(user);

		try {
			if (user == null) {
				request.setAttribute("msg", "用户名密码错误");
				request.getRequestDispatcher("/login.jsp").forward(request,
						response);
				return;
			} else {
				HttpSession session = request.getSession(true);
				session.setAttribute("user", user);
				request.getRequestDispatcher("/index.jsp").forward(request,
						response);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * 注销
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	private void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		response.sendRedirect(Tools.Basepath(request, response)+"index.jsp");
	}
}
