package com.coachMenu.controller;

import java.io.IOException;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coachMenu.model.*;
import com.coachMenuList.model.CoachMenuListJDBCDAO;
import com.coachMenuList.model.CoachMenuListService;

public class CoachMenuServlet extends HttpServlet implements Servlet {
	private static final long serialVersionUID = 1L;
       
    public CoachMenuServlet() {
        super();
    }


	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if ("addmenu".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
				Integer userID = Integer.parseInt(req.getParameter("userID"));
//				try {
//					userID = Integer.parseInt(req.getParameter("userID"));
//				} catch (NumberFormatException ne) {
//					
//				}

				String menuName = req.getParameter("menuName");
				if (menuName.trim().length() == 0) {
					errorMsgs.add("請輸入菜單名稱");
				}

				String priceStr = req.getParameter("price");
				Integer price = null;
				if (priceStr.trim().length() == 0) {
					errorMsgs.add("請輸入菜單價格");
				}else {
					try {
						price = Integer.parseInt(priceStr);
					} catch (NumberFormatException ne) {
						errorMsgs.add("價格格式錯誤");
					}
				}
				
				Boolean isPublic = true;
				if(price != null) {
					if (price != 0) {
						isPublic = false;
					}
				}
				
				Integer positionNo = null;
				try {
					positionNo = Integer.parseInt(req.getParameter("positionNo"));
				} catch (Exception e) {
					errorMsgs.add("請選擇部位");
				}
				System.out.println(positionNo);

				Set<Integer> refVideos = new HashSet<Integer>();
				Integer refVideo1 = Integer.parseInt(req.getParameter("refVideo1"));
				refVideos.add(refVideo1);
				Integer refVideo2 = Integer.parseInt(req.getParameter("refVideo2"));
				refVideos.add(refVideo2);
				Integer refVideo3 = Integer.parseInt(req.getParameter("refVideo3"));
				refVideos.add(refVideo3);

				CoachMenuVO coachMenuVO = new CoachMenuVO();
				coachMenuVO.setMenuName(menuName);
				coachMenuVO.setUserID(userID);
				coachMenuVO.setPrice(price);
				coachMenuVO.setIsPublic(isPublic);
				coachMenuVO.setPositionNo(positionNo);
				
				if(!errorMsgs.isEmpty()) {
					for(String message : errorMsgs) {
						System.out.println(message);
					}
					req.setAttribute("coachMenuVO", coachMenuVO);
					RequestDispatcher failureView  = req.getRequestDispatcher("/html/coach/protected_coach/buildMenu.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/*************************** 2.開始新增資料 ***************************************/
				
				CoachMenuService coachmenuSvc = new CoachMenuService();
				CoachMenuVO coachmenu = coachmenuSvc.addCoachMenu(userID, menuName, price, isPublic, positionNo);
				Integer menuID = coachmenu.getMenuID();
				CoachMenuListService coachmenulistSvc = new CoachMenuListService();
				for(Integer videoID : refVideos) {
					coachmenulistSvc.addCoachMenuList(menuID, videoID);
				}

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				
				RequestDispatcher successView = req.getRequestDispatcher("/html/coach/protected_coach/coach_overview.jsp");
				successView.forward(req, res);
				
			} catch (Exception e) {
				e.printStackTrace();
				errorMsgs.add("資料有誤，無法新增菜單");
				RequestDispatcher failureView = req.getRequestDispatcher("/html/coach/protected_coach/buildMenu.jsp");
				failureView.forward(req, res);
			}
		}
	}

}
