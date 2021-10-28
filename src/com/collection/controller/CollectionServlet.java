package com.collection.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.collection.model.CollectionService;
import com.collection.model.CollectionVO;
import com.google.gson.Gson;

public class CollectionServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		System.out.println(action);
		
		if ("insert".equals(action)) {
			PrintWriter out = res.getWriter();
			res.setCharacterEncoding("UTF-8");
			/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
			Integer userID = new Integer(req.getParameter("userid"));
			Integer itemID = new Integer(req.getParameter("itemid"));
			
			CollectionVO collectionVO = new CollectionVO();
			collectionVO.setUserID(userID);
			collectionVO.setItemID(itemID);
			/*************************** 2.開始新增資料 ***************************************/
			CollectionService collectionSve = new CollectionService();
			collectionVO = collectionSve.addCollection(userID, itemID);
			
			//AJAX存取
			List<String> list = new ArrayList<String>();
			list.add(userID.toString());
			list.add(itemID.toString());
			String json = new Gson().toJson(list);
			res.setContentType("application/json");
			res.setCharacterEncoding("UTF-8");
			out.write(json);
			out.close();
		}
		
		
	}
}
