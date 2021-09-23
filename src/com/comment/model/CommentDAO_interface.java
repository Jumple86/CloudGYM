package com.comment.model;

import java.util.List;

public interface CommentDAO_interface {
	public void insert(CommentVO commentVO);
	public void update(CommentVO commentVO);
	public void delete(Integer commentID);
	public CommentVO findByPrimaryKey(Integer commentID);
	public List<CommentVO> findAll();
}
