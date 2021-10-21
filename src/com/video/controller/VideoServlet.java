package com.video.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.video.model.VideoService;
import com.video.model.VideoVO;

public class VideoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		doPost(req, res);		
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if("updatelist".equals(action)) {//接收來自back_end_video.jsp資料
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				Integer videoID = new Integer(req.getParameter("videoID").trim());
				
				VideoService videoSvc = new VideoService();
				VideoVO vo = videoSvc.findByPrimaryKey(videoID);
				
				Boolean Listed = new Boolean(req.getParameter("videoshow"+videoID));
				if (vo.getListed()==true) {
					vo.setListed(false);
				}else {
					vo.setListed(true);												
					}
				
				/***************************2.開始修改資料*****************************************/
				vo = videoSvc.update(vo);
				System.out.println("2."+vo.getListed());
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				HttpSession session = req.getSession();
				Object whichPage = session.getAttribute("whichPage");
				String url = "/html/back_end_video.jsp?whichPage="+whichPage;
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/html/back_end_video.jsp");
				failureView.forward(req, res);
			}						
		}
	}
}
