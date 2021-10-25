package com.posts.controller;

import java.io.*;
import java.sql.Timestamp;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;

import com.posts.model.*;

@MultipartConfig
public class PostsServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
							
		if ("getOne_For_Display".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
			try {
				String str = req.getParameter("postsid");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("輸入文章編號");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/posts/selectPostsPage.jsp");
					failureView.forward(req, res);
					return;
				}
				Integer postsid = null;
				try {
					postsid = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("文章編號格式不正確");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/posts/selectPostsPage.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始查詢資料 *****************************************/
				PostsService postsSvc = new PostsService();
				PostsVO postsVO = postsSvc.getByPostsID(postsid);
				if (postsVO == null) {
					errorMsgs.add("查無資料");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/posts/selectPostsPage.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("postsVO", postsVO);
				String url = "/Forum/ArticlePage.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/posts/selectPostsPage.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getOne_For_Update".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ****************************************/
				Integer postsid = new Integer(req.getParameter("postsid"));

				/*************************** 2.開始查詢資料 ****************************************/
				PostsService postsSvc = new PostsService();
				PostsVO postsVO = postsSvc.getByPostsID(postsid);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("postsVO", postsVO);
				String url = "/html/UpdateArticle.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/posts/listAllPosts.jsp");
				failureView.forward(req, res);
			}
		}
		

		if ("update".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				Integer postsid = new Integer(req.getParameter("postsid"));

				String poststitle = req.getParameter("poststitle").trim();
				if (poststitle == null || poststitle.trim().length() == 0) {
					errorMsgs.add("標題請勿空白");
				}

				String postscontent = req.getParameter("postscontent").trim();
				if (postscontent == null || postscontent.trim().length() == 0) {
					errorMsgs.add("內容請勿空白");
				}

				InputStream in = req.getPart("postsimg").getInputStream();
				byte[] postsimg = null;
				if (in.available() != 0) {
					postsimg = new byte[in.available()];
					in.read(postsimg);
					in.close();
				} else {
					errorMsgs.add("請上傳圖片");
				}
				
//				Timestamp postspublishdate = new Timestamp(System.currentTimeMillis());

				Integer tagid = new Integer(req.getParameter("tagid").trim());

				PostsVO postsVO = new PostsVO();
				postsVO.setPostsID(postsid);
				postsVO.setPostsTitle(poststitle);
				postsVO.setPostsContent(postscontent);
				postsVO.setPostsImg(postsimg);
//				postsVO.setPostsPublishDate(postspublishdate);
				postsVO.setTagID(tagid);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("postsVO", postsVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/Forum/UpdateArticle.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始修改資料 *****************************************/
				PostsService postsSvc = new PostsService();
				postsVO = postsSvc.updatePosts(poststitle, postscontent, postsimg, tagid, postsid);


				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("postsVO", postsVO);
				String url = "/html/ArticleList.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/Forum/UpdateArticle.jsp");
				failureView.forward(req, res);
			}
		}

		if ("insert".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
//				Integer userid = new Integer(req.getParameter("userid"));
				
				Integer userid = new Integer(2005);

				String poststitle = req.getParameter("poststitle").trim();
				if (poststitle == null || poststitle.trim().length() == 0) {
					errorMsgs.add("文章標題請勿空白");
				}

				String postscontent = req.getParameter("postscontent").trim();
				if (postscontent == null || postscontent.trim().length() == 0) {
					errorMsgs.add("文章內容請勿空白");
				}

				InputStream in = req.getPart("postsimg").getInputStream();
				byte[] postsimg = null;
				if (in.available() != 0) {
					postsimg = new byte[in.available()];
					in.read(postsimg);
					in.close();
				} else {
					errorMsgs.add("請上傳文章封面圖片");
				}
				
				Timestamp postspublishdate = new Timestamp(System.currentTimeMillis());
				
				Integer tagid = new Integer(req.getParameter("tagid"));

				PostsVO postsVO = new PostsVO();
				postsVO.setUserID(userid);
				postsVO.setPostsTitle(poststitle);
				postsVO.setPostsContent(postscontent);
				postsVO.setPostsImg(postsimg);
				postsVO.setPostsPublishDate(postspublishdate);
				postsVO.setTagID(tagid);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("postsVO", postsVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/html/AddArticle.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
				PostsService postsSvc = new PostsService();
				postsVO = postsSvc.addPosts(userid, poststitle, postscontent, postsimg, postspublishdate, tagid);

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/html/ArticleList.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("XXX.jsp");
				failureView.forward(req, res);
			}
		}

		if ("delete".equals(action)) {
				List<String> errorMsgs = new LinkedList<String>();
				req.setAttribute("errorMsgs", errorMsgs);
		
				/*************************** 1.接收請求參數 ***************************************/
				try {
				Integer postID= new Integer(req.getParameter("postsid"));

				/*************************** 2.開始刪除資料 ***************************************/
				PostsService postsSvc = new PostsService();
				postsSvc.deletePosts(postID);

				/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
				String url = "/html/back_end_post_page.jsp?postID="+postID;
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/html/back_end_post.jsp");
				failureView.forward(req, res);
			}
		}
	}

}