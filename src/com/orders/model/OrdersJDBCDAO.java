package com.orders.model;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class OrdersJDBCDAO implements OrdersDAO_interface {

	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/CloudGYM?serverTimezone=Asia/Taipei";
	String userid = "David";
	String passwd = "123456";

	private static final String INSERT_STMT = "INSERT INTO orders(orderNo, userID, totalPrice) VALUES(?, ?, ?)";
	private static final String UPDATE_STMT = "UPDATE orders SET userID=?, builtDate=?, totalPrice=? WHERE orderNo=?";
	private static final String FIND_BY_ORDERNO_STMT = "SELECT * FROM orders WHERE orderNo = ?";
	private static final String FIND_BY_USERID_STMT = "SELECT * FROM orders WHERE userID = ?";
	private static final String FIND_BY_DATE_STMT = "SELECT * FROM orders WHERE builtDate LIKE \"%\"" + "?" + "\"%\"";
	private static final String FIND_ALL = "SELECT * FROM orders"; 

	@Override
	public void insert(OrdersVO ordersVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, ordersVO.getOrderNo());
			pstmt.setInt(2, ordersVO.getUserID());
//			pstmt.setTimestamp(3, ordersVO.getBuiltDate());
			pstmt.setInt(3, ordersVO.getTotalPrice());

			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	@Override
	public void update(OrdersVO ordersVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE_STMT);
			
			pstmt.setInt(1, ordersVO.getUserID());
			pstmt.setTimestamp(2, ordersVO.getBuiltDate());
			pstmt.setInt(3, ordersVO.getTotalPrice());
			pstmt.setInt(4, ordersVO.getOrderNo());
			
			pstmt.executeUpdate();
			
			
		}catch(SQLException se) {
			se.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				}catch(SQLException se) {
					se.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				}catch(SQLException se) {
					se.printStackTrace();
				}
			}
		}
	}
	
	@Override
	public OrdersVO findByOrderNo(Integer orderNo) {
		OrdersVO ordersVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(FIND_BY_ORDERNO_STMT);

			pstmt.setInt(1, orderNo);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				ordersVO = new OrdersVO();
				ordersVO.setOrderNo(rs.getInt("orderNo"));
				ordersVO.setUserID(rs.getInt("userID"));
				ordersVO.setBuiltDate(rs.getTimestamp("builtDate"));
				ordersVO.setTotalPrice(rs.getInt("totalPrice"));
			}
		} catch (SQLException se) {
			// TODO Auto-generated catch block
			se.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException se) {
					se.printStackTrace();
				}
			}
		}
		return ordersVO;
	}

	@Override
	public OrdersVO findByUserID(Integer userID) {

		OrdersVO ordersVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(FIND_BY_USERID_STMT);

			pstmt.setInt(1, userID);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				ordersVO = new OrdersVO();
				ordersVO.setOrderNo(rs.getInt("orderNo"));
				ordersVO.setUserID(rs.getInt("userID"));
				ordersVO.setBuiltDate(rs.getTimestamp("builtDate"));
				ordersVO.setTotalPrice(rs.getInt("totalPrice"));
			}
		} catch (SQLException se) {
			// TODO Auto-generated catch block
			se.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException se) {
					se.printStackTrace();
				}
			}
		}

		return ordersVO;
	}

	@Override
	public List<OrdersVO> findByDate(String date) {
		
		List<OrdersVO> list = new ArrayList<OrdersVO>();
		OrdersVO ordersVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(FIND_BY_DATE_STMT);
			
			pstmt.setString(1, date);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ordersVO = new OrdersVO();
				ordersVO.setOrderNo(rs.getInt("orderNo"));
				ordersVO.setUserID(rs.getInt("userID"));
				ordersVO.setBuiltDate(rs.getTimestamp("builtDate"));
				ordersVO.setTotalPrice(rs.getInt("totalPrice"));
				list.add(ordersVO);
			}
		
		
		}catch(SQLException se) {
			se.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		
		return list;
	}

	@Override
	public List<OrdersVO> findAll() {

		List<OrdersVO> list = new ArrayList<OrdersVO>();
		OrdersVO ordersVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(FIND_ALL);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ordersVO = new OrdersVO();
				ordersVO.setOrderNo(rs.getInt("orderNo"));
				ordersVO.setUserID(rs.getInt("userID"));
				ordersVO.setBuiltDate(rs.getTimestamp("builtDate"));
				ordersVO.setTotalPrice(rs.getInt("totalPrice"));
				list.add(ordersVO);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return list;
	}

	
	public static void main(String[] args) {
		
		OrdersJDBCDAO dao = new OrdersJDBCDAO();
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String str = sd.format(new Date(System.currentTimeMillis()));
		Timestamp ts = Timestamp.valueOf(str);
		
		Scanner sc = new Scanner(System.in);
//		int orderNo = sc.nextInt();
//		int userID = sc.nextInt();
//		int totalPrice = sc.nextInt();
		

		
		// 新增
//		OrdersVO ordersVO1 = new OrdersVO();
//		ordersVO1.setOrderNo(orderNo);
//		ordersVO1.setUserID(userID);
//		ordersVO1.setBuiltDate(ts);
//		ordersVO1.setTotalPrice(totalPrice);
//		
//		dao.insert(ordersVO1);
		
		
		// 修改
//		OrdersVO ordersVO2 = new OrdersVO();
//		ordersVO2.setOrderNo(orderNo);
//		ordersVO2.setUserID(userID);
//		ordersVO2.setBuiltDate(ts);
//		ordersVO2.setTotalPrice(totalPrice);
//		dao.update(ordersVO2);
//		
		// 用訂單編號查詢
		OrdersVO ordersVO3 = dao.findByOrderNo(90001);
		System.out.print(ordersVO3.getOrderNo() + ",");
		System.out.print(ordersVO3.getUserID() + ",");
		System.out.print(ordersVO3.getBuiltDate() + ",");
		System.out.print(ordersVO3.getTotalPrice());
		System.out.println();

		// 用會員編號查詢
//		OrdersVO ordersVO3 = dao.findByUserID(userID);
//		System.out.print(ordersVO3.getOrderNo() + ",");
//		System.out.print(ordersVO3.getUserID() + ",");
//		System.out.print(ordersVO3.getBuiltDate() + ",");
//		System.out.print(ordersVO3.getTotalPrice());
//		System.out.println();
		
		
		// 用日期查詢
//		List<OrdersVO> list = dao.findByDate("1'OR'1'='1");
//		for(OrdersVO orders : list) {
//			System.out.print(orders.getOrderNo() + ",");
//			System.out.print(orders.getUserID() + ",");
//			System.out.print(orders.getBuiltDate() + ",");
//			System.out.print(orders.getTotalPrice());
//			System.out.println();
//		}
		
		
		// 查詢全部
		List<OrdersVO> list2 = dao.findAll();
		for(OrdersVO orders : list2) {
			System.out.print(orders.getOrderNo() + ",");
			System.out.print(orders.getUserID() + ",");
			System.out.print(orders.getBuiltDate() + ",");
			System.out.print(orders.getTotalPrice());
			System.out.println();
		}
	}

	
}