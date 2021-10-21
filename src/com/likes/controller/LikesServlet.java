package com.likes.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.likes.model.*;

public class LikesServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("insert".equals(action)) {
			Integer postsid = new Integer(req.getParameter("postsid"));
			Integer userid = new Integer(req.getParameter("userid"));

			LikesVO likesVO = new LikesVO();
			likesVO.setPostsID(postsid);
			likesVO.setUserID(userid);
			LikesService likesSvc = new LikesService();
			likesVO = likesSvc.addLikes(postsid, userid);

			RequestDispatcher successView = req.getRequestDispatcher("/html/ArticleList.jsp");
			successView.forward(req, res);
		}

//		if ("delete".equals(action)) {
//			Integer likesid = new Integer(req.getParameter("likesid"));
//
//			LikesService likesSvc = new LikesService();
//			likesSvc.deleteLikes(likesid);
//
//			RequestDispatcher successView = req.getRequestDispatcher("/Forum/ArticleList.jsp");
//			successView.forward(req, res);
//		}

	}
}
