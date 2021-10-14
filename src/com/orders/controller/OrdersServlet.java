package com.orders.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.coach.model.*;
import com.coachMenu.model.*;
import com.google.gson.Gson;
import com.subList.model.*;
import com.video.model.*;

import redis.clients.jedis.Jedis;

public class OrdersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public OrdersServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("addCart".equals(action)) {

			res.setCharacterEncoding("UTF-8");
			PrintWriter out = res.getWriter();

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			Jedis jedis = new Jedis("localhost", 6379);

			try {
				HttpSession session = req.getSession();
				String username = (String) session.getAttribute("username");
				String uri = (String) session.getAttribute("uri");

				if (username == null) { // 判斷是否有登入
					errorMsgs.add("請先登入會員");
					res.sendRedirect(uri);
					return;
				}

				// 取得商品id和商品名稱並存到redis裡
				String menuID = req.getParameter("menuID");
				String menuName = req.getParameter("menuName");
				String subID = req.getParameter("subID");
				String userID = req.getParameter("userID");
				String videoID = req.getParameter("videoID");
				String title = req.getParameter("title");

				if (menuID != null && menuName != null) {
					jedis.hset(username, menuID, menuName);
//					System.out.println(jedis.hgetAll(username));
				}
				
				if (subID != null && userID != null) {
					jedis.hset(username, userID, subID);
				}

				if (videoID != null && title != null) {
					jedis.hset(username, videoID, title);
				}

				// 把要傳回ajax的資料用list包起來
				List<Long> list = new ArrayList<>();
				long hlen = jedis.hlen(username);
				list.add(hlen);
				String json = new Gson().toJson(list);
				res.setContentType("application/json");
				res.setCharacterEncoding("UTF-8");
				out.write(json);

				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				jedis.close();
				out.close();
//				req.getRequestDispatcher(servletPath).forward(req, res);
			}
		}

		if ("deleteProduct".equals(action)) {

			res.setCharacterEncoding("UTF-8");
			PrintWriter out = res.getWriter();

			List<String> errorMsgs = new LinkedList<>();
			req.setAttribute("errorMsgs", errorMsgs);
			Jedis jedis = new Jedis("localhost", 6379);
			try {
				// 取得當前登入的人
				HttpSession session = req.getSession();
				String username = (String) session.getAttribute("username");
				// 取得要刪除的menuID或userID
				String menuID = req.getParameter("menuID");
				String userID = req.getParameter("userID");
				String videoID = req.getParameter("videoID");
				int deletedPrice = 0;

				// 判斷要用menuID還是userID刪除資料
				if (menuID != null) {
					// 透過menuID取得價格
					CoachMenuService coachMenuSvc = new CoachMenuService();
					CoachMenuVO coachMenuVO = coachMenuSvc.getByMenuID(Integer.parseInt(menuID));
					deletedPrice = coachMenuVO.getPrice();

					// 透過menuID去刪redis裡的資料 = 刪除購物車裡的東西
					jedis.hdel(username, menuID);
				}
				
				if (userID != null) {
					// 透過redis取得subID再去取得價格
					Integer subID = Integer.parseInt(jedis.hget(username, userID));
					SubListService sublistSvc = new SubListService();
					SubListVO sublistVO = sublistSvc.getBySubID(subID);
					deletedPrice = sublistVO.getPrice();

					// 刪除redis裡的資料
					jedis.hdel(username, userID);
				}

				if (videoID != null) {
					// 透過videoID取得價格
					VideoService videoSvc = new VideoService();
					VideoVO videoVO = videoSvc.findByPrimaryKey(Integer.parseInt(videoID));
					deletedPrice = videoVO.getPrice();

					// 刪除redis裡的資料
					jedis.hdel(username, videoID);
				}

				// 把要傳回ajax的資料用list包起來
				List<Long> list = new ArrayList();
				long hlen = jedis.hlen(username);
				list.add((long) deletedPrice);
				list.add(hlen);

				String json = new Gson().toJson(list);
				res.setContentType("application/json");
				res.setCharacterEncoding("UTF-8");
				out.write(json);
				req.setAttribute("hlen", jedis.hlen(username));

				

				// 刪除完成，返回原頁面
//				res.sendRedirect(req.getContextPath() + "/html/pay_page.jsp");
			} catch (Exception e) {

			} finally {
				if (jedis != null) {
					jedis.close();
				}
				if (out != null) {
					out.close();
				}
			}
		}

	}
}
