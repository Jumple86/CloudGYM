package com.report.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.posts.model.PostsService;
import com.report.model.*;
import com.reportRecord.model.*;
import com.video.model.VideoService;

import java.util.*;

public class ReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReportServlet() {
        super();
    }


	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if("addreport".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			PrintWriter out = res.getWriter();
			res.setCharacterEncoding("UTF-8");
			
			try {
				Integer userID = (Integer) req.getSession().getAttribute("userID");
				
				String videoIDstr = req.getParameter("videoID");
				Integer videoID = null;
				if(videoIDstr != null) {
					videoID = Integer.parseInt(videoIDstr);
				}
				
				String postsIDstr = req.getParameter("postsID");
				Integer postsID = null;
				if(postsIDstr != null) {
					postsID = Integer.parseInt(postsIDstr);
				}
				
				ReportService reportSvc = new ReportService();
				ReportRecordService reportrecordSvc = new ReportRecordService();
				List<ReportRecordVO> recordlist = reportrecordSvc.getAll();
				List<Integer> items = new ArrayList<Integer>();
				for(ReportRecordVO vo : recordlist) {
					Integer itemID = vo.getItemID();
					items.add(itemID);
				}
				if(videoIDstr != null && videoIDstr.trim().length() != 0) {
					 reportSvc.addReport(userID, videoID);
					 Integer authorID = new VideoService().findByPrimaryKey(videoID).getUserID();
					 if(!items.contains(videoID)) {
						 reportrecordSvc.addReportRecord(videoID, authorID);
					 }
				}
				if(postsIDstr != null && postsIDstr.trim().length() != 0) {
					reportSvc.addReport(userID, postsID);
					Integer authorID = new PostsService().getByPostsID(postsID).getUserID();
					if(!items.contains(postsID)) {
						reportrecordSvc.addReportRecord(postsID, authorID);
					}
				}
				
				List<String> list = new ArrayList<String>();
//				list.add("檢舉成功");
				String json = new Gson().toJson(list);
				res.setContentType("application/json");
				res.setCharacterEncoding("UTF-8");
				out.write(json);
			}catch (Exception e) {
				// TODO: handle exception
			}finally {
				if(out != null) {
					out.close();
				}
			}
		}
	}

}
