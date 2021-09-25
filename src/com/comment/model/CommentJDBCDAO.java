package com.comment.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CommentJDBCDAO implements CommentDAO_interface {

	private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
	private static final String URL = "jdbc:mysql://localhost:3306/CloudGYM?serverTimezone=Asia/Taipei";
	private static final String USER = "David";
	private static final String PASSWORD = "123456";
	private static final String INSERT = "INSERT INTO COMMENT(postsID, userID, commentContent, commentPublishDate, commentShow) VALUES(?, ?, ?, ?, ?)";
	private static final String UPDATE = "UPDATE COMMENT SET commentContent=?, commentPublishDate=?, commentShow=? WHERE commentID=?";
	private static final String DELETE = "DELETE FROM COMMENT WHERE COMMENTID = ?";
	private static final String FIND_PK = "SELECT * FROM COMMENT WHERE COMMENTID = ?";
	private static final String FIND_ALL = "SELECT * FROM COMMENT";

	static {
		try {
			Class.forName(DRIVER);
		} catch (ClassNotFoundException ce) {
			ce.printStackTrace();
		}
	}

	@Override
	public void insert(CommentVO commentVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(INSERT);

			pstmt.setInt(1, commentVO.getPostsID());
			pstmt.setInt(2, commentVO.getUserID());
			pstmt.setString(3, commentVO.getCommentContent());
			pstmt.setTimestamp(4, commentVO.getCommentPublishDate());
			pstmt.setBoolean(5, commentVO.isCommentShow());
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
	public void update(CommentVO commentVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, commentVO.getCommentContent());
			pstmt.setTimestamp(2, commentVO.getCommentPublishDate());
			pstmt.setBoolean(3, commentVO.isCommentShow());
			pstmt.setInt(4, commentVO.getCommentID());
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
	public void delete(Integer commentID) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(DELETE);
			pstmt.setInt(1, commentID);
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
	public CommentVO findByPrimaryKey(Integer commentID) {
		CommentVO commentVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(FIND_PK);
			pstmt.setInt(1, commentID);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				commentVO = new CommentVO();
				commentVO.setCommentID(rs.getInt("commentid"));
				commentVO.setPostsID(rs.getInt("postsid"));
				commentVO.setUserID(rs.getInt("userid"));
				commentVO.setCommentContent(rs.getString("commentcontent"));
				commentVO.setCommentPublishDate(rs.getTimestamp("commentpublishdate"));
				commentVO.setCommentShow(rs.getBoolean("commentshow"));
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
		return commentVO;
	}

	@Override
	public List<CommentVO> findAll() {
		List<CommentVO> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(FIND_ALL);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				CommentVO commentVO = new CommentVO();
				commentVO.setCommentID(rs.getInt("commentid"));
				commentVO.setPostsID(rs.getInt("postsid"));
				commentVO.setUserID(rs.getInt("userid"));
				commentVO.setCommentContent(rs.getString("commentcontent"));
				commentVO.setCommentPublishDate(rs.getTimestamp("commentpublishdate"));
				commentVO.setCommentShow(rs.getBoolean("commentshow"));
				list.add(commentVO);
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

}