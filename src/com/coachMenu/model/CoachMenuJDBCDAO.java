package com.coachMenu.model;

import java.util.*;
import java.sql.*;
import java.sql.Date;
import java.text.SimpleDateFormat;

public class CoachMenuJDBCDAO implements CoachMenuDAO_interface {

	private static final String driver = "com.mysql.cj.jdbc.Driver";
	private static final String url = "jdbc:mysql://localhost:3306/CloudGYM?serverTimezone=Asia/Taipei";
	private static final String userid = "David";
	private static final String passwd = "123456";

	private static final String INSERT_STMT = "INSERT INTO coachMenu(menuID, userID, menuName, price) VALUES(?, ?, ?, ?);";
	private static final String UPDATE_STMT = "UPDATE coachMenu SET userID=?, menuName=?, publishDate=?, price=? WHERE menuID=?";
	private static final String DELETE_STMT = "DELETE FROM coachMenu WHERE menuID=?";
	private static final String FIND_BY_MENUID = "SELECT * FROM coachMenu WHERE menuID=?";
	private static final String FIND_BY_USERID = "SELECT * FROM coachMenu WHERE userID=?";
	private static final String FIND_ALL = "SELECT * FROM coachMenu";

	static {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void insert(CoachMenuVO coachMenuVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setInt(1, coachMenuVO.getMenuID());
			pstmt.setInt(2, coachMenuVO.getUserID());
			pstmt.setString(3, coachMenuVO.getMenuName());
			pstmt.setInt(4, coachMenuVO.getPrice());
			pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
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
	public void update(CoachMenuVO coachMenuVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE_STMT);
			
			pstmt.setInt(1, coachMenuVO.getUserID());
			pstmt.setString(2, coachMenuVO.getMenuName());
			pstmt.setTimestamp(3, coachMenuVO.getPublishDate());
			pstmt.setInt(4, coachMenuVO.getPrice());
			pstmt.setInt(5, coachMenuVO.getMenuID());
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
	public void delete(Integer menuID) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE_STMT);
			pstmt.setInt(1, menuID);
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
	public CoachMenuVO findByMenuID(Integer menuID) {
		CoachMenuVO coachMenuVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(FIND_BY_MENUID);
			
			pstmt.setInt(1, menuID);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				coachMenuVO = new CoachMenuVO();
				coachMenuVO.setMenuID(rs.getInt("menuID"));
				coachMenuVO.setUserID(rs.getInt("userID"));
				coachMenuVO.setMenuName(rs.getString("menuName"));
				coachMenuVO.setPublishDate(rs.getTimestamp("publishDate"));
				coachMenuVO.setPrice(rs.getInt("price"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
		return coachMenuVO;
	}

	@Override
	public List<CoachMenuVO> findByUserID(Integer userID) {
		List<CoachMenuVO> list = new ArrayList<CoachMenuVO>();
		CoachMenuVO coachMenuVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(FIND_BY_USERID);
			
			pstmt.setInt(1, userID);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				coachMenuVO = new CoachMenuVO();
				coachMenuVO.setMenuID(rs.getInt("menuID"));
				coachMenuVO.setUserID(rs.getInt("userID"));
				coachMenuVO.setMenuName(rs.getString("menuName"));
				coachMenuVO.setPublishDate(rs.getTimestamp("publishDate"));
				coachMenuVO.setPrice(rs.getInt("price"));
				list.add(coachMenuVO);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
	public List<CoachMenuVO> findAll() {

		List<CoachMenuVO> list = new ArrayList<CoachMenuVO>();
		CoachMenuVO coachMenuVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(FIND_ALL);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				coachMenuVO = new CoachMenuVO();
				coachMenuVO.setMenuID(rs.getInt("menuID"));
				coachMenuVO.setUserID(rs.getInt("userID"));
				coachMenuVO.setMenuName(rs.getString("menuName"));
				coachMenuVO.setPublishDate(rs.getTimestamp("publishDate"));
				coachMenuVO.setPrice(rs.getInt("price"));
				list.add(coachMenuVO);
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
		CoachMenuJDBCDAO dao = new CoachMenuJDBCDAO();
		
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String str = sd.format(new Date(System.currentTimeMillis()));
		Timestamp ts = Timestamp.valueOf(str);
		
		// 新增
//		CoachMenuVO coachMenuVO1 = new CoachMenuVO();
//		coachMenuVO1.setMenuID(60012);
//		coachMenuVO1.setUserID(2006);
//		coachMenuVO1.setMenuName("����2");
//		coachMenuVO1.setPublishDate(ts);
//		coachMenuVO1.setPrice(50);
//		dao.insert(coachMenuVO1);
		
		// 修改
//		CoachMenuVO coachMenuVO2 = new CoachMenuVO();
//		coachMenuVO2.setMenuID(60012);
//		coachMenuVO2.setUserID(2006);
//		coachMenuVO2.setMenuName("���մ���");
//		coachMenuVO2.setPublishDate(ts);
//		coachMenuVO2.setPrice(100);
//		dao.update(coachMenuVO2);
		
		// 刪除
		dao.delete(60011);
		
		
		// 用菜單編號查詢
//		CoachMenuVO cmvo = dao.findByMenuID(60005);
//		System.out.print(cmvo.getMenuID() + ", ");
//		System.out.print(cmvo.getUserID() + ", ");
//		System.out.print(cmvo.getMenuName() + ", ");
//		System.out.print(cmvo.getPublishDate() + ", ");
//		System.out.print(cmvo.getPrice());
//		System.out.println();
		
		// 用會員編號查詢
//		List<CoachMenuVO> list = dao.findByUserID(2002);
//		for(CoachMenuVO menu : list) {
//			System.out.print(menu.getMenuID() + ", ");
//			System.out.print(menu.getUserID() + ", ");
//			System.out.print(menu.getMenuName() + ", ");
//			System.out.print(menu.getPublishDate() + ", ");
//			System.out.print(menu.getPrice());
//			System.out.println();
//		}
		
		// 查詢全部
		List<CoachMenuVO> list2 = dao.findAll();
		for(CoachMenuVO menu : list2) {
			System.out.print(menu.getMenuID() + ",\t");
			System.out.print(menu.getUserID() + ",\t");
			System.out.print(menu.getMenuName() + ",\t");
			System.out.print(menu.getPublishDate() + ",\t");
			System.out.print(menu.getPrice());
			System.out.println();
		}
	}
}
