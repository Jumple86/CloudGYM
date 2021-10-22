package com.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/protected_user/LogoutHandler")
public class LogoutHandler extends HttpServlet {

	/**
	 * @category 退出登入的Servlet,登出
	 * @author Bird
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		HttpSession session = req.getSession(false);//防止建立Session
		if(session == null){
			res.sendRedirect(req.getContextPath() + "/html/login_user.jsp");
			return;
		}
		
		session.removeAttribute("account");
		session.removeAttribute("name");
		session.removeAttribute("id");
		res.sendRedirect(req.getContextPath() + "/html/login_user.jsp");

	}

}
