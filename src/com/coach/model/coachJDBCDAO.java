package com.coach.model;

import java.util.*;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class coachJDBCDAO implements coachDAO_interface {
	
	private static final String driver = "com.mysql.cj.jdbc.Driver";
	private static final String url = "jdbc:mysql://localhost:3306/cloudGYM?serverTimezone=Asia/Taipei";
	private static final String userid = "David";
	private static final String passwd = "123456";
	
	private static final String INSERT_STMT = 
			"INSERT INTO coach(userID,coachAccount,coachName,coachPassword,coachImg,coachSex,coachBirthday,coachDescription,coachRegisteredDate,coachCertificate,reportedTimes) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
	private static final String UPDATE_STMT = 
			"UPDATE coach SET coachAccount=?,coachName=?, coachPassword=?,coachImg=?, coachSex=?, coachBirthday=?, coachDescription=?, coachRegisteredDate=?,coachCertificate=?,reportedTimes=? WHERE userID=?";
	private static final String DELETE_STMT =
			"DELETE FROM coach WHERE userID=?";
	private static final String FIND_BY_USERID_STMT = 
			"SELECT * FROM coach WHERE userID = ?";
	private static final String FIND_ALL = 
			"SELECT * FROM coach";
	
	static {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException ce) {
			ce.printStackTrace();
		}
	}

	@Override
	public void insert(coachVO coachVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, coachVO.getUserID());
			pstmt.setString(2, coachVO.getCoachAccount());
			pstmt.setString(3, coachVO.getCoachName());
			pstmt.setString(4, coachVO.getCoachPassword());
			pstmt.setBytes(5, coachVO.getCoachImg());
			pstmt.setString(6, coachVO.getCoachSex());
			pstmt.setDate(7, coachVO.getCoachBirthday());
			pstmt.setString(8, coachVO.getCoachDescription());
			pstmt.setDate(9, coachVO.getCoachRegisteredDate());
			pstmt.setString(10, coachVO.getCoachCertificate());
			pstmt.setInt(11, coachVO.getReportedTimes());
			
			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
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
	public void update(coachVO coachVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE_STMT);
			
			pstmt.setString(1, coachVO.getCoachAccount());
			pstmt.setString(2, coachVO.getCoachName());
			pstmt.setString(3, coachVO.getCoachPassword());
			pstmt.setBytes(4, coachVO.getCoachImg());
			pstmt.setString(5, coachVO.getCoachSex());
			pstmt.setDate(6, coachVO.getCoachBirthday());
			pstmt.setString(7, coachVO.getCoachDescription());
			pstmt.setDate(8, coachVO.getCoachRegisteredDate());
			pstmt.setString(9, coachVO.getCoachCertificate());
			pstmt.setInt(10, coachVO.getReportedTimes());
			pstmt.setInt(11, coachVO.getUserID());
			
			
			pstmt.executeUpdate();
			
		}catch (SQLException e) {
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
	public void delete(Integer userID) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE_STMT);
			pstmt.setInt(1, userID);
			
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
	public coachVO findByUserID(Integer userID) {

		coachVO coachVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(FIND_BY_USERID_STMT);
			pstmt.setInt(1, userID);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				coachVO = new coachVO();
				coachVO.setUserID(rs.getInt("userID"));
				coachVO.setCoachAccount(rs.getString("coachAccount"));
				coachVO.setCoachName(rs.getString("coachName"));
				coachVO.setCoachPassword(rs.getString("coachPassword"));
				coachVO.setCoachImg(rs.getBytes("coachImg"));
				coachVO.setCoachSex(rs.getString("coachSex"));
				coachVO.setCoachBirthday(rs.getDate("coachBirthday"));
				coachVO.setCoachDescription(rs.getString("coachDescription"));
				coachVO.setCoachRegisteredDate(rs.getDate("coachRegisteredDate"));
				coachVO.setCoachCertificate(rs.getString("coachCertificate"));
				coachVO.setReportedTimes(rs.getInt("reportedTimes"));
			}
		} catch (SQLException se) {
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

		return coachVO;
	}

	@Override
	public List<coachVO> findAll() {

		List<coachVO> list = new ArrayList<coachVO>();
		coachVO coachVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(FIND_ALL);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				coachVO = new coachVO();
				coachVO.setUserID(rs.getInt("userID"));
				coachVO.setCoachAccount(rs.getString("coachAccount"));
				coachVO.setCoachName(rs.getString("coachName"));
				coachVO.setCoachPassword(rs.getString("coachPassword"));
				coachVO.setCoachImg(rs.getBytes("coachImg"));
				coachVO.setCoachSex(rs.getString("coachSex"));
				coachVO.setCoachBirthday(rs.getDate("coachBirthday"));
				coachVO.setCoachDescription(rs.getString("coachDescription"));
				coachVO.setCoachRegisteredDate(rs.getDate("coachRegisteredDate"));
				coachVO.setCoachCertificate(rs.getString("coachCertificate"));
				coachVO.setReportedTimes(rs.getInt("reportedTimes"));
				list.add(coachVO);
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
	
	public static void main(String[] args) throws IOException {
		
		coachJDBCDAO dao = new coachJDBCDAO();

//	新增
//		coachVO coachVO1 = new coachVO();
//		coachVO1.setUserID(2006);
//		coachVO1.setCoachAccount("Gojo-Satoru@gmail.com");
//		coachVO1.setCoachName("五條悟");
//		coachVO1.setCoachPassword("Gojo12345");
//		byte[] pic = getPictureByteArray("items/Gojo.jpg");
//		coachVO1.setCoachImg(pic);
//		coachVO1.setCoachSex("男");
//		coachVO1.setCoachBirthday(java.sql.Date.valueOf("1995-03-03"));
//		coachVO1.setCoachDescription("嗨");
//		coachVO1.setCoachRegisteredDate(java.sql.Date.valueOf("2005-01-01"));
//		coachVO1.setCoachCertificate("無");
//		coachVO1.setReportedTimes(3);
//		dao.insert(coachVO1);
//		System.out.println("新增成功\");
		
//	更新
//		coachVO coachVO2 = new coachVO();
//		coachVO2.setUserID(2006);
//		coachVO2.setCoachAccount("Satoru@gmail.com");
//		coachVO2.setCoachName("五條");
//		coachVO2.setCoachPassword("Gojo12");
//		coachVO2.setCoachSex("女");
//		byte[] pic2 = getPictureByteArray("items/Grass-Wonder.jpg");
//		coachVO2.setCoachImg(pic2);
//		coachVO2.setCoachBirthday(java.sql.Date.valueOf("1995-03-03"));
//		coachVO2.setCoachDescription("yo");
//		coachVO2.setCoachRegisteredDate(java.sql.Date.valueOf("2005-01-01"));
//		coachVO2.setCoachCertificate("NO");
//		coachVO2.setReportedTimes(5);
//		dao.update(coachVO2);
//		System.out.println("更新成功");
		
		
//		刪除
//		dao.delete(2006);
//		System.out.println("刪除成功");
		
//		用會員編號查詢
		coachVO coachVO3 = dao.findByUserID(2001);
		System.out.println(coachVO3.getUserID()+ ",");
		System.out.println();
		System.out.print(coachVO3.getCoachAccount() + ",");
		System.out.println();
		System.out.print(coachVO3.getCoachName() + ",");
		System.out.println();
		System.out.print(coachVO3.getCoachPassword() + ",");
		System.out.println();
		System.out.println(coachVO3.getCoachImg()+ ",");
		System.out.println();
		System.out.println(coachVO3.getCoachSex()+ ",");
		System.out.println();
		System.out.println(coachVO3.getCoachBirthday()+ ",");
		System.out.println();
		System.out.println(coachVO3.getCoachDescription()+ ",");
		System.out.println();
		System.out.println(coachVO3.getCoachRegisteredDate()+ ",");
		System.out.println();
		System.out.println(coachVO3.getCoachCertificate()+ ",");
		System.out.println();
		System.out.println(coachVO3.getReportedTimes());
		System.out.println();
		
//		查詢全部
//		List<coachVO>list = dao.findAll();
//		for(coachVO coach:list) {
//			System.out.println(coach.getUserID()+ ",");
//			System.out.print(coach.getCoachAccount() + ",");
//			System.out.print(coach.getCoachName() + ",");
//			System.out.print(coach.getCoachPassword() + ",");
//			System.out.println(coach.getCoachImg()+ ",");
//			System.out.println(coach.getCoachSex()+ ",");
//			System.out.println(coach.getCoachBirthday()+ ",");
//			System.out.println(coach.getCoachDescription()+ ",");
//			System.out.println(coach.getCoachRegisteredDate()+ ",");
//			System.out.println(coach.getCoachCertificate()+ ",");
//			System.out.println(coach.getReportedTimes());
//			System.out.println();	
//		}
	}

	public static byte[] getPictureByteArray(String path) throws IOException {
		FileInputStream fis = new FileInputStream(path);
		byte[] buffer = new byte[fis.available()];
		fis.read(buffer);
		fis.close();
		return buffer;
	}
}