package com.posts.model;

import java.util.List;

public interface PostsDAO_interface {
	public void insert(PostsVO postsVO);
	public void update(PostsVO postsVO);
	public void delete(Integer postsID);
	public PostsVO findByPrimaryKey(Integer postsID);
	public List<PostsVO> findAll();
}
