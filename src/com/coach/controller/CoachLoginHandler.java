package com.coach.controller;

import java.io.*;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

import com.coach.model.CoachService;
import com.coach.model.CoachVO;
import com.user.model.*;

@WebServlet("/html/coachloginhandler")
public class CoachLoginHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		req.setCharacterEncoding("Big5");
		res.setContentType("text/html; charset=Big5");

		// 【取得使用者 帳號(account) 密碼(password)】
		String account = req.getParameter("account");
		String password = req.getParameter("password");
		
		String action = req.getParameter("action");

		if ("login".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				
				if (account == null || (account.trim()).length() == 0) {
					errorMsgs.add("請輸入會員帳號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/html/login_coach.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				String coachAccount = null;
				try {
					coachAccount = new String(account);
				} catch (Exception e) {
					errorMsgs.add("會員帳號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/html/login_coach.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始查詢資料 *****************************************/
				CoachService coachSvc = new CoachService();
				CoachVO coachVO = coachSvc.findByCoachAccount(coachAccount);
				String correctpsw = coachVO.getCoachPassword();
				
				if (coachVO == null) {
					errorMsgs.add("查無資料");
				}else  {
					if(!password.equals(correctpsw)) {
						errorMsgs.add("密碼錯誤");
					}
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/html/login_coach.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("coachVO", coachVO); // 資料庫取出的userVO物件,存入req
				String name = coachVO.getCoachName();
				Integer id = coachVO.getUserID();
				
				// 【帳號 , 密碼有效時, 才做以下工作】
				HttpSession session = req.getSession();
				session.setAttribute("coachAccount", account); // *工作1: 才在session內做已經登入過的標識
				session.setAttribute("coachName", name);
				session.setAttribute("userID", id);
	
				try {
					String location = (String) session.getAttribute("location");
					if (location != null) {
						session.removeAttribute("location"); // *工作2: 看看有無來源網頁 (-->如有來源網頁:則重導至來源網頁)
						res.sendRedirect(location);
						return;
					}
				} catch (Exception ignored) {
				}
	
				res.sendRedirect(req.getContextPath() + "/html/main_page.jsp"); // *工作3: (-->如無來源網頁:則重導至login_success.jsp)

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/html/login_coach.jsp");
				failureView.forward(req, res);
			}
		}
	}
}
