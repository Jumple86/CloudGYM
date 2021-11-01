package com.customMenu.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.customMenuList.model.*;
import com.google.gson.Gson;

import java.util.*;

public class CustomMenuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CustomMenuServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action = req.getParameter("action");
		req.setCharacterEncoding("UTF-8");
		
		if("putmenu".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			PrintWriter out = res.getWriter();
			try {
				Integer userID = Integer.parseInt(req.getParameter("userID"));
				Integer videoID = Integer.parseInt(req.getParameter("videoID"));
				Integer menuID = Integer.parseInt(req.getParameter("menuID"));
				
				CustomMenuListService custommenulistSvc = new CustomMenuListService();
				custommenulistSvc.add(menuID, videoID);
				
				List<String> list = new ArrayList<>();
				String json = new Gson().toJson(list);
				res.setContentType("application/json");
				res.setCharacterEncoding("UTF-8");
				out.write(json);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				if(out != null) {
					out.close();
				}
			}
			
		}
		
	}

}
