package com.subscription.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class subscriptionJDBCDAO  implements subscriptionDAO_interface{
	
	private static final String driver = "com.mysql.cj.jdbc.Driver";
	private static final String url = "jdbc:mysql://localhost:3306/cloudGYM?serverTimezone=Asia/Taipei";
	private static final String userid = "David";
	private static final String passwd = "123456";

	private static final String INSERT_STMT ="INSERT INTO subscription(subNo,subID,userID)VALUES(?,?,?)";
	private static final String UPDATE_STMT ="UPDATE subscription SET subID=?,userID=? WHERE subNo=?";
	private static final String DELETE_STMT = "DELETE FROM subscription WHERE subNo=?";
	private static final String FIND_BY_SUBNO = "SELECT * FROM subscription WHERE subNo=?";
	private static final String FIND_ALL = "SELECT * FROM subscription";
	
	static {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException ce) {
			ce.printStackTrace();
		}
	}
	
	@Override
	public void insert(subscriptionVO subscriptionVO) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url,userid,passwd);
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setInt(1, subscriptionVO.getSubNo());
			pstmt.setInt(2, subscriptionVO.getSubID());
			pstmt.setInt(3, subscriptionVO.getUserID());
			
			pstmt.executeUpdate();
			
		}catch (ClassNotFoundException e) {
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
	public void update(subscriptionVO subscriptionVO) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE_STMT);
			

			pstmt.setInt(1, subscriptionVO.getSubID());
			pstmt.setInt(2, subscriptionVO.getUserID());
			pstmt.setInt(3, subscriptionVO.getSubNo());
			
			pstmt.executeUpdate();
			
		}catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public void delete(Integer subNo) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE_STMT);
			pstmt.setInt(1, subNo);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
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
	}

	@Override
	public subscriptionVO findBySubNo(Integer subNo) {
		// TODO Auto-generated method stub
		subscriptionVO subscriptionVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(FIND_BY_SUBNO);
			pstmt.setInt(1, subNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				subscriptionVO = new subscriptionVO();
				subscriptionVO.setSubNo(rs.getInt("subNo"));
				subscriptionVO.setSubID(rs.getInt("subID"));
				subscriptionVO.setUserID(rs.getInt("userID"));
			}
		} catch (SQLException e) {
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
		return subscriptionVO;
	}

	@Override
	public List<subscriptionVO> findAll() {
		// TODO Auto-generated method stub
		List<subscriptionVO> list = new ArrayList<subscriptionVO>();
		subscriptionVO subscriptionVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(FIND_ALL);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				subscriptionVO = new subscriptionVO();
				subscriptionVO.setSubNo(rs.getInt("subNo"));
				subscriptionVO.setSubID(rs.getInt("subID"));
				subscriptionVO.setUserID(rs.getInt("userID"));

				list.add(subscriptionVO);
			}
		} catch (SQLException e) {
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
		subscriptionJDBCDAO dao = new subscriptionJDBCDAO();
		

//		Scanner sc = new Scanner(System.in);
//		System.out.println("輸入編號");
//		int subNo = sc.nextInt();
//		System.out.println("輸入訂閱編號");
//		int subID = sc.nextInt();
//		System.out.println("輸入會員編號");
//		int userID = sc.nextInt();
//		sc.close();
		
		// 新增
//		subscriptionVO sub = new subscriptionVO();
//		sub.setSubNo(subNo);
//		sub.setSubID(subID);
//		sub.setUserID(userID);
//		dao.insert(sub);
//		System.out.println("新增成功");
		
		// 更新
//		subscriptionVO sub2 = new subscriptionVO();
//		sub2.setSubNo(11);
//		sub2.setSubID(70012);
//		sub2.setUserID(2013);
//		dao.update(sub2);
//		System.out.println("更新成功");
		
//		subscriptionVO sub2 = new subscriptionVO();
//		sub2.setSubNo(subNo);
//		sub2.setSubID(subID);
//		sub2.setUserID(userID);
//		dao.update(sub2);
//		System.out.println("更新成功");
		
		
		// 刪除
//		dao.delete(subNo);
//		System.out.println("刪除成功");
		
		// 用菜單明細編號查詢(只開輸入編號)
//		subscriptionVO sub = dao.findBySubNo(subNo);
//		System.out.print(sub.getSubNo() + ", ");
//		System.out.print(sub.getSubID() + ", ");
//		System.out.print(sub.getUserID());
//		System.out.println();
//		System.out.println("查詢成功");
		
		// 查詢全部
				List<subscriptionVO> list = dao.findAll();
				for(subscriptionVO subVo : list) {
					System.out.print(subVo.getSubNo() + ", ");
					System.out.print(subVo.getSubID() + ", ");
					System.out.print(subVo.getUserID() );
					System.out.println();
					System.out.println("查詢成功");
				}
	}
}
