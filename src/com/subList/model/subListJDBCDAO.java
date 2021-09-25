package com.subList.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class subListJDBCDAO implements subListDAO_interface {
	
	private static final String driver = "com.mysql.cj.jdbc.Driver";
	private static final String url = "jdbc:mysql://localhost:3306/cloudGYM?serverTimezone=Asia/Taipei";
	private static final String userid = "David";
	private static final String passwd = "123456";
	
	private static final String INSERT_STMT ="INSERT INTO subList(subID,duration,subName,price) VALUES(?,?,?,?)";
	private static final String UPDATE_STMT ="UPDATE subList SET duration=?,subName=?,price=? WHERE subID=?";
	private static final String DELETE_STMT = "DELETE FROM subList WHERE subID=?";
	private static final String FIND_BY_SUBID_STMT ="SELECT * FROM subList WHERE subID = ?";
	private static final String FIND_ALL ="SELECT * FROM subList";
	
	static {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException ce) {
			ce.printStackTrace();
		}
	}

	@Override
	public void insert(subListVO subListVO) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url,userid,passwd);
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setInt(1, subListVO.getSubID());
			pstmt.setString(2, subListVO.getDuration());
			pstmt.setString(3, subListVO.getSubName());
			pstmt.setInt(4, subListVO.getPrice());
			
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
	public void update(subListVO subListVO) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url,userid,passwd);
			pstmt = con.prepareStatement(UPDATE_STMT);
			
			pstmt.setString(1, subListVO.getDuration());
			pstmt.setString(2, subListVO.getSubName());
			pstmt.setInt(3, subListVO.getPrice());
			pstmt.setInt(4, subListVO.getSubID());
			
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
	public void delete(Integer subID) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE_STMT);
			pstmt.setInt(1, subID);
			
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
	public subListVO findBySubID(Integer subID) {
		// TODO Auto-generated method stub
		subListVO subListVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(FIND_BY_SUBID_STMT);
			
			pstmt.setInt(1, subID);
			
			rs =pstmt.executeQuery();
			
			while(rs.next()) {
				subListVO = new subListVO();
				subListVO.setSubID(rs.getInt("subID"));
				subListVO.setDuration(rs.getString("duration"));
				subListVO.setSubName(rs.getNString("subName"));
				subListVO.setPrice(rs.getInt("price"));
			}
		}catch (SQLException se) {
			// TODO Auto-generated catch block
			se.printStackTrace();
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

		return subListVO;
	}


	@Override
	public List<subListVO> findAll() {
		// TODO Auto-generated method stub
		List<subListVO> list = new ArrayList<subListVO>();
		subListVO subListVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(FIND_ALL);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				subListVO = new subListVO();
				subListVO.setSubID(rs.getInt("subID"));
				subListVO.setDuration(rs.getString("duration"));
				subListVO.setSubName(rs.getString("subName"));
				subListVO.setPrice(rs.getInt("price"));
				
				list.add(subListVO);
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
		subListJDBCDAO dao = new subListJDBCDAO();
		
		//更新
//		subListVO sbl = new subListVO();
//		sbl.setSubID(70011);
//		sbl.setDuration("三個月");
//		sbl.setSubName("季方案");
//		sbl.setPrice(400);
//		dao.insert(sbl);
//		System.out.println("更新成功");
		
		
		
		//更新
//		subListVO sbl2 = new subListVO();
//		sbl2.setDuration("十二個月");
//		sbl2.setSubName("年方案");
//		sbl2.setPrice(1000);
//		sbl2.setSubID(70011);
//		dao.update(sbl2);
//		System.out.println("更新成功");
		
		// 刪除
//		dao.delete(70011);
//		System.out.println("刪除成功");
		
		//用subID搜尋
//		subListVO sbl3 = dao.findBySubID(subID);
//		System.out.println(sbl3.getSubID()+",");
//		System.out.println(sbl3.getDuration()+",");
//		System.out.println(sbl3.getSubName()+",");
//		System.out.println(sbl3.getPrice());
//		System.out.println();
		
		//查詢全部
		List<subListVO>list = dao.findAll();
		for(subListVO subList : list) {
			System.out.println(subList.getSubID()+",");
			System.out.println(subList.getDuration()+",");
			System.out.println(subList.getSubName()+",");
			System.out.println(subList.getPrice());
			System.out.println();
		}
	}
}
