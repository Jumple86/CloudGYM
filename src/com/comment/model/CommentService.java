package com.comment.model;

import java.sql.Timestamp;
import java.util.List;

public class CommentService {

	private CommentDAO_interface dao;

	public CommentService() {
		dao = new CommentJDBCDAO();
	}

	public CommentVO addComment(Integer postsID, Integer userID, String commentContent, Timestamp commentPublishDate,
			boolean commentShow) {
		CommentVO commentVO = new CommentVO();
		commentVO.setPostsID(postsID);
		commentVO.setUserID(userID);
		commentVO.setCommentContent(commentContent);
		commentVO.setCommentPublishDate(commentPublishDate);
		commentVO.setCommentShow(commentShow);
		dao.insert(commentVO);
		return commentVO;
	}

	public CommentVO updateComment(String commentContent, Timestamp commentPublishDate, boolean commentShow,
			Integer commentID) {
		CommentVO commentVO = new CommentVO();
		commentVO.setCommentContent(commentContent);
		commentVO.setCommentPublishDate(commentPublishDate);
		commentVO.setCommentShow(commentShow);
		commentVO.setCommentID(commentID);
		dao.update(commentVO);
		return commentVO;
	}

	public void deleteComment(Integer commentID) {
		dao.delete(commentID);
	}

	public CommentVO getByCommtntID(Integer commentID) {
		return dao.findByPrimaryKey(commentID);
	}

	public List<CommentVO> getAll() {
		return dao.findAll();
	}

}