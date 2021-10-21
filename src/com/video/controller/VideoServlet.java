package com.video.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.video.model.VideoService;
import com.video.model.VideoVO;


@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 100 * 1024 * 1024, maxRequestSize = 500 * 1024 * 1024)
//當數據量大於fileSizeThreshold值時，內容將被寫入磁碟
//上傳過程中無論是單個文件超過maxFileSize值，或者上傳的總量大於maxRequestSize 值都會拋出IllegalStateException 異常
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
				System.out.println(videoID);
				
				VideoService videoSvc = new VideoService();
				VideoVO vo = videoSvc.findByPrimaryKey(videoID);
				
				Boolean Listed = new Boolean(req.getParameter("videoshow"+videoID));
				Boolean b2 = new Boolean(true);
//				try {
					if (Listed.equals(b2)) {
						System.out.println("1."+Listed);
						vo.setListed(false);
					}else {
						vo.setListed(true);						
						
					}
//				} catch (Exception e) {
					
//				}
								
				vo = videoSvc.update(vo);
				System.out.println("2."+vo.getListed());
								
//				Integer commentAuth = null;
//				try {
//					commentAuth = new Integer(req.getParameter("commentAuth"));
//					if (commentAuth != null) {
//						vo.setCommentAuth(1);						
//					}
//					System.out.println("comm=" + commentAuth);					
//				}catch(Exception e) {
//					vo.setCommentAuth(0);
//				}
//								
//				Integer videoAuth = null;
//				try {
//					videoAuth = new Integer(req.getParameter("videoAuth"));
//					if (videoAuth != null) {
//						vo.setVideoAuth(1);
//					}
//					System.out.println("video="+ videoAuth);					
//				}catch(Exception e) {
//					vo.setVideoAuth(0);
//				}
//						
//				Integer subAuth = null;
//				try {
//					subAuth = new Integer(req.getParameter("subAuth"));
//					if (subAuth != null) {
//						vo.setSubAuth(1);				
//					}
//					System.out.println("sub="+subAuth);					
//				}catch(Exception e) {
//					vo.setSubAuth(0);
//				}
//					
//				Integer userAuth = null;
//				try {
//					userAuth = new Integer(req.getParameter("userAuth"));
//					if (userAuth != null) {
//						vo.setUserAuth(1);		
//					}
//					System.out.println("user="+userAuth);					
//				}catch(Exception e) {
//					vo.setUserAuth(0);
//				}

				/***************************2.開始修改資料*****************************************/
//				AdminService adminSvc = new AdminService();
//				adminVO = adminSvc.updatAdmin(adminID, adminName, adminPW, commentAuth, videoAuth, subAuth, userAuth);
				
//				vo = adminSvc.updatAdmin(vo);
//				System.out.println(vo.getCommentAuth());
//				System.out.println(vo.getSubAuth());
//				System.out.println(vo.getUserAuth());
//				System.out.println(vo.getVideoAuth());
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				String url = "/html/back_end_video.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/html/back_end_video.jsp");
				failureView.forward(req, res);
			}						
		}
		
		if("upload".equals(action)) {
			List<String> errorMsgs = new LinkedList<>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
//				String 
				String[] actionnames = req.getParameterValues("actionname");
				
				Part part = req.getPart("video");
				System.out.println(part.getSize());
				String filename = part.getSubmittedFileName();
				if(filename.equals("")) {
					System.out.println("true");
				}
				System.out.println(filename);
				byte[] buf = null;
				if(filename.length() != 0 && part.getSize() != 0) {
					InputStream in = part.getInputStream();
					buf = new byte[in.available()];
					in.read(buf);
					in.close();
				}
			}catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
	}
}
