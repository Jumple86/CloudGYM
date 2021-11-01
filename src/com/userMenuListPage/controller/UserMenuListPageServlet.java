package com.userMenuListPage.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.customMenu.model.CustomMenuService;
import com.customMenuList.model.*;
import com.video.model.*;
import com.videoAction.model.*;
import com.process.model.*;
import com.coachMenuList.model.*;

public class UserMenuListPageServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		List<CustomMenuListVO> list1 = new ArrayList<>();
		try {
			list1 = (ArrayList<CustomMenuListVO>)req.getAttribute("menulist");
			req.setAttribute("menulist", list1);
		}  catch(Exception e) {
			
		}

		if ("getAll".equals(action)) {
			try {
				Integer menuID = new Integer(req.getParameter("menuID"));

				CustomMenuListService cmlSvc = new CustomMenuListService();
				list1 = cmlSvc.getAll(menuID);
				
				HttpSession session = req.getSession();
				session.setAttribute("menulist", list1);
				
				String url = "/html/user/protected_user/userMenuListPage1.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch (Exception e) {

			}
		}

		if ("getCoach".equals(action)) {
			try {
				Integer itemID = new Integer(req.getParameter("itemID"));
				CoachMenuListService coachSvc = new CoachMenuListService();
				List<CoachMenuListVO> list = coachSvc.getByMenuID(itemID);
				
				req.setAttribute("coachlist", list);
				
				String url = "/html/user/protected_user/userMenuListPage2.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			}catch(Exception e){
				
			}
		}
		
		if("goto".equals(action)) {
			try {
				Integer menuID = new Integer(req.getParameter("menuID"));
				System.out.println(menuID);
				CustomMenuListService cmlSvc = new CustomMenuListService();
				list1 = cmlSvc.getAll(menuID);
				CustomMenuService cmSvc = new CustomMenuService();
				String menuTitle = cmSvc.findByPrimaryKey(menuID).getTitle();

//				req.setAttribute("menulist", list1);
				req.setAttribute("menuTitle", menuTitle);
				req.setAttribute("menuID", menuID);
				
				String url = "/html/user/protected_user/userMenuListPage2.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
			}catch(Exception e) {
				
			}
		}
		
		if("playVideo".equals(action)) {
			try {
				String menuTitle = req.getParameter("menuTitle");
				Integer videoID = new Integer(req.getParameter("id"));
				VideoService videoSvc = new VideoService();
				VideoVO play = videoSvc.findByPrimaryKey(videoID);
				Integer listID = new Integer(req.getParameter("listID"));
				System.out.println(listID);
				ProcessService processSvc = new ProcessService();
				List<ProcessVO> process = processSvc.getByListID(listID);
				VideoActionService vaSvc = new VideoActionService();
				List<VideoActionVO> actions = vaSvc.getByVideoID(videoID);
				
				req.setAttribute("actions", actions);
//				req.setAttribute("menulist", list1);
				req.setAttribute("process", process);
				req.setAttribute("menuTitle", menuTitle);
				req.setAttribute("play", play);
				String url = "/html/user/protected_user/userMenuListPage2.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			}catch(Exception e){
				
			}
		}
		if("changeProcess".equals(action)) {
//			try {
//				Integer processNo = new Integer(req.getParameter("processNo"));
//				System.out.println(processNo);
//				
//			}catch(Exception e) {
//				
//			}
		}
//		if("back".equals(action)){
//			try {
//				String url = "/userMenuListPage/userMenuListPage1.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url);
//				successView.forward(req, res);
//			}catch(Exception e){
//				
//			}
//		}
	}
}
