package com.marriage.servlets;

import java.io.File;
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
import com.marriage.dao.impl.AdminDAO;
import com.marriage.dao.interfaces.IAdminDAO;
import com.marriage.model.User;

public class AdminServlet extends HttpServlet {
	IAdminDAO dao = new AdminDAO();

	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getParameter("cmd");
		System.out.println(cmd);
		if (cmd.equals("login")) {
			login(request, response);
		} else if (cmd.equals("userlist")) {
			userlist(request, response);
		} else if (cmd.equals("useradd")) {
			useradd(request, response);
		} else if (cmd.equals("userdel")) {
			userdel(request, response);
		} else if (cmd.equals("upreedit")){
			user_pre_edit(request, response);
		} else if (cmd.equals("useredit")){
			user_edit(request, response);
		} else if (cmd.equals("logout")){
			logout(request,response);
		}
	}

	
	private void login(HttpServletRequest request, HttpServletResponse response) {
		User user = new User();
		user.setUsername(request.getParameter("username"));
		user.setPassword(request.getParameter("password"));
		user = dao.login(user);

		try {
			if (user == null) {
				request.setAttribute("msg", "用户名密码错误或非管理员");
				request.getRequestDispatcher("/admin/login.jsp").forward(
						request, response);
				return;
			} else {
				HttpSession session = request.getSession(true);
				session.setAttribute("user", user);
				request.getRequestDispatcher("/admin/admin.jsp").forward(
						request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void userlist(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		PageControl pc = new PageControl();
		Integer currindex = 1;
		if (request.getParameter("index") != null) {
			currindex = Integer.parseInt(request.getParameter("index"));
		}
		pc.setCurrentindex(currindex);
		Pager<User> pager = dao.list(pc);
		request.setAttribute("pager", pager);
		request.getRequestDispatcher("/admin/ulist.jsp").forward(request,
				response);
	}

	private void useradd(HttpServletRequest request,
			HttpServletResponse response) {

		User user = new User();
		try {
			BeanUtils.populate(user, request.getParameterMap());
			Integer rtn = dao.add(user);
			if (rtn > 0) {
				request.getRequestDispatcher("/admin?cmd=userlist").forward(
						request, response);
			} else {
				request.setAttribute("msg", "添加用户失败或请不要再重复添加");
				request.getRequestDispatcher("/admin/uadd.jsp").forward(
						request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void user_pre_edit(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("user", dao.find_one(Integer.parseInt(request.getParameter("id"))));
		request.getRequestDispatcher("/admin/uedit.jsp").forward(request, response);
	}
	
	private void user_edit(HttpServletRequest request,
			HttpServletResponse response) {
		User user = new User();
		try {
			BeanUtils.populate(user, request.getParameterMap());
			user.setUserid(Integer.parseInt(request.getParameter("id")));
			Integer rtn = dao.update(user);
			if (rtn > 0) {
				request.setAttribute("msg", "更新成功");
			} else {
				request.setAttribute("msg", "更新失败");
			}
			request.getRequestDispatcher("/admin?cmd=userlist").forward(
					request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void userdel(HttpServletRequest request,
			HttpServletResponse response) {
		Integer rtn = dao.delete(Integer.parseInt(request.getParameter("id")));
		if (rtn > 0) {
			request.setAttribute("msg", "删除成功！");
		}else{
			request.setAttribute("msg", "删除失败！");
		}
		try {
			request.getRequestDispatcher("/admin?cmd=userlist").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		response.sendRedirect(Tools.Basepath(request, response)+"/admin/login.jsp");
	}
}
