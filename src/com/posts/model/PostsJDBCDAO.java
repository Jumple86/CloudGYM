package com.posts.model;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PostsJDBCDAO implements PostsDAO_interface {

	private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
	private static final String URL = "jdbc:mysql://localhost:3306/CloudGYM?serverTimezone=Asia/Taipei";
	private static final String USER = "David";
	private static final String PASSWORD = "123456";
	private static final String INSERT = "INSERT INTO POSTS(postsID, userID, postsTitle, postsContent, postsImg, postsPublishDate, tagID, postsShow) VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String UPDATE = "UPDATE POSTS SET postsTitle=?, postsContent=?, postsImg=?, postsPublishDate=?, tagID=?, postsShow=? WHERE postsID=?";
	private static final String DELETE = "DELETE FROM POSTS WHERE POSTSID = ?";
	private static final String FIND_PK = "SELECT * FROM POSTS WHERE POSTSID = ?";
	private static final String FIND_ALL = "SELECT * FROM POSTS";

	static {
		try {
			Class.forName(DRIVER);
		} catch (ClassNotFoundException ce) {
			ce.printStackTrace();
		}
	}

	@Override
	public void insert(PostsVO postsVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(INSERT);

			pstmt.setInt(1, postsVO.getPostsID());
			pstmt.setInt(2, postsVO.getUserID());
			pstmt.setString(3, postsVO.getPostsTitle());
			pstmt.setString(4, postsVO.getPostsContent());
			pstmt.setBytes(5, postsVO.getPostsImg());
			pstmt.setTimestamp(6, postsVO.getPostsPublishDate());
			pstmt.setInt(7, postsVO.getTagID());
			pstmt.setBoolean(8, postsVO.isPostsShow());
			pstmt.executeUpdate();

		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
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
				} catch (Exception se) {
					se.printStackTrace();
				}
			}
		}
	}

	@Override
	public void update(PostsVO postsVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, postsVO.getPostsTitle());
			pstmt.setString(2, postsVO.getPostsContent());
			pstmt.setBytes(3, postsVO.getPostsImg());
			pstmt.setTimestamp(4, postsVO.getPostsPublishDate());
			pstmt.setInt(5, postsVO.getTagID());
			pstmt.setBoolean(6, postsVO.isPostsShow());
			pstmt.setInt(7, postsVO.getPostsID());
			pstmt.executeUpdate();

		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
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
				} catch (Exception se) {
					se.printStackTrace();
				}
			}
		}
	}

	@Override
	public void delete(Integer postsID) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(DELETE);
			pstmt.setInt(1, postsID);
			pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
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
				} catch (Exception se) {
					se.printStackTrace();
				}
			}
		}
	}

	@Override
	public PostsVO findByPrimaryKey(Integer postsID) {
		PostsVO postsVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(FIND_PK);
			pstmt.setInt(1, postsID);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				postsVO = new PostsVO();
				postsVO.setPostsID(rs.getInt("postsid"));
				postsVO.setUserID(rs.getInt("userid"));
				postsVO.setPostsTitle(rs.getString("poststitle"));
				postsVO.setPostsContent(rs.getString("postscontent"));
				postsVO.setPostsImg(rs.getBytes("postsimg"));
				postsVO.setPostsPublishDate(rs.getTimestamp("postspublishdate"));
				postsVO.setTagID(rs.getInt("tagid"));
				postsVO.setPostsLikes(rs.getInt("postslikes"));
				postsVO.setPostsReportedTimes(rs.getInt("postsreportedtimes"));
				postsVO.setPostsShow(rs.getBoolean("postsshow"));
			}
		} catch (SQLException se) {
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
		return postsVO;
	}

	@Override
	public List<PostsVO> findAll() {
		List<PostsVO> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(FIND_ALL);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				PostsVO postsVO = new PostsVO();
				postsVO.setPostsID(rs.getInt("postsid"));
				postsVO.setUserID(rs.getInt("userid"));
				postsVO.setPostsTitle(rs.getString("poststitle"));
				postsVO.setPostsContent(rs.getString("postscontent"));
				postsVO.setPostsImg(rs.getBytes("postsimg"));
				postsVO.setPostsPublishDate(rs.getTimestamp("postspublishdate"));
				postsVO.setTagID(rs.getInt("tagid"));
				postsVO.setPostsLikes(rs.getInt("postslikes"));
				postsVO.setPostsReportedTimes(rs.getInt("postsreportedtimes"));
				postsVO.setPostsShow(rs.getBoolean("postsshow"));
				list.add(postsVO);
			}

		} catch (SQLException se) {
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
		return list;
	}

	public static void main(String[] args) throws IOException {
		PostsJDBCDAO dao = new PostsJDBCDAO();

//		新增
//		PostsVO postsVO = new PostsVO();
//		postsVO.setPostsID(40011);
//		postsVO.setUserID(1002);
//		postsVO.setPostsTitle("ABCD");
//		postsVO.setPostsContent("DCBA");
//		postsVO.setPostsImg(getPictureByteArray("items/img1.png"));
//		postsVO.setPostsPublishDate(java.sql.Timestamp.valueOf("2021-01-01 11:11:11"));
//		postsVO.setTagID(20);
//		postsVO.setPostsShow(true);
//		dao.insert(postsVO);
//		System.out.println("新增成功");

//		修改
//		PostsVO postsVO = new PostsVO();
//		postsVO.setPostsTitle("ABCDAAAAA");
//		postsVO.setPostsContent("DCBAAAAA");
//		postsVO.setPostsImg(getPictureByteArray("items/img2.jpg"));
//		postsVO.setPostsPublishDate(java.sql.Timestamp.valueOf("2021-02-02 22:22:22"));
//		postsVO.setTagID(30);
//		postsVO.setPostsShow(false);
//		postsVO.setPostsID(40011);
//		dao.update(postsVO);
//		System.out.println("修改成功");

//		刪除
//		dao.delete(40011);
//		System.out.println("刪除成功");

//		查詢PK
//		PostsVO PK = dao.findByPrimaryKey(40003);
//		System.out.println(PK);

//		查詢All
//		List<PostsVO> list = dao.findAll();
//		for (PostsVO all : list) {
//			System.out.println(all);
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