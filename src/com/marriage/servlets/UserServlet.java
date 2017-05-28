package com.marriage.servlets;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

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
		} else if (cmd.equals("edit")){
			edit(request,response);
		} else if (cmd.equals("edit_avatar")){
			edit_avatar(request, response);
		}
	}

	private void register(HttpServletRequest request,
			HttpServletResponse response) {
		User user = new User();
		try {
			BeanUtils.populate(user, request.getParameterMap());
			Integer rtn = dao.register(user);
			if (rtn > 0) {
				request.setAttribute("msg", "注册成功请登录");
				request.getRequestDispatcher("/login.jsp").forward(request,response);
			} else {
				request.setAttribute("msg", "添加用户失败或请不要再重复添加");
				request.getRequestDispatcher("/register.jsp").forward(request,response);
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
				request.getRequestDispatcher("/login.jsp").forward(request,response);
				return;
			} else {
				HttpSession session = request.getSession(true);
				session.setAttribute("user", user);
				response.sendRedirect(Tools.Basepath(request, response)+"home");
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
		response.sendRedirect(request.getHeader("Referer"));
	}

	private void edit(HttpServletRequest request, HttpServletResponse response) {
		User user = new User();
		try {
			BeanUtils.populate(user, request.getParameterMap());
			user.setUserid(Integer.parseInt(request.getParameter("id")));
			Integer rtn = dao.edit(user);
			if (rtn > 0) {
				request.setAttribute("msg", "更新成功");
			} else {
				request.setAttribute("msg", "更新失败");
			}
			request.getRequestDispatcher("/edit.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void edit_avatar(HttpServletRequest request, HttpServletResponse response) {
		User user = new User();
		user.setUserid(Integer.parseInt(request.getParameter("id")));
        
        String uploadPath = "images/avatar/";
        String tempPath = "images/tmp/";
        String serverPath = getServletContext().getRealPath("/").replace("\\", "/");  
        if(!new File(serverPath+uploadPath).isDirectory()){  
            new File(serverPath+uploadPath).mkdirs();  
        }  
        if(!new File(serverPath+tempPath).isDirectory()){  
            new File(serverPath+tempPath).mkdirs();  
        }
        
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setRepository(new File(serverPath+tempPath));
        
        factory.setSizeThreshold(1024*1024);
        ServletFileUpload upload = new ServletFileUpload(factory);  
        upload.setSizeMax(-1);
        
        String filePath = null;  
        
        try {  
            List<FileItem> list = upload.parseRequest(request);  
            for(FileItem item : list){  
                if(!item.isFormField()){
                	String fileName = item.getName().toLowerCase();
                	String uuid = UUID.randomUUID().toString();
                    filePath = serverPath+uploadPath+uuid+fileName.substring(fileName.lastIndexOf("."));
                    item.write(new File(filePath));
                    
                    user.setAvatar(uuid+fileName.substring(fileName.lastIndexOf(".")));
                    dao.avatar(user);
                    request.setAttribute("msg", "上传成功！");
                    request.getRequestDispatcher("/avatar.jsp").forward(request, response);
                }  
            }  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
	}
}
