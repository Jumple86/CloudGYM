package com.posts.model;

import java.sql.Timestamp;
import java.util.List;

public class PostsService {

	private PostsDAO_interface dao;

	public PostsService() {
		dao = new PostsJDBCDAO();
	}

	public PostsVO addPosts(Integer userID, String postsTitle, String postsContent, byte[] postsImg,
			Timestamp postsPublishDate, Integer tagID, boolean postsShow) {
		PostsVO postsVO = new PostsVO();
		postsVO.setUserID(userID);
		postsVO.setPostsTitle(postsTitle);
		postsVO.setPostsContent(postsContent);
		postsVO.setPostsImg(postsImg);
		postsVO.setPostsPublishDate(postsPublishDate);
		postsVO.setTagID(tagID);
		postsVO.setPostsShow(postsShow);
		dao.insert(postsVO);
		return postsVO;
	}

	public PostsVO updatePosts(String postsTitle, String postsContent, byte[] postsImg, Timestamp postsPublishDate,
			Integer tagID, boolean postsShow, Integer postsID) {
		PostsVO postsVO = new PostsVO();
		postsVO.setPostsTitle(postsTitle);
		postsVO.setPostsContent(postsContent);
		postsVO.setPostsImg(postsImg);
		postsVO.setPostsPublishDate(postsPublishDate);
		postsVO.setTagID(tagID);
		postsVO.setPostsShow(postsShow);
		postsVO.setPostsID(postsID);
		dao.update(postsVO);
		return postsVO;
	}

	public void deletePosts(Integer postsID) {
		dao.delete(postsID);
	}

	public PostsVO getByPostsID(Integer postsID) {
		return dao.findByPrimaryKey(postsID);
	}
	
	public List<PostsVO>getTopPost() {
		return dao.findByTopPost();
	}
	

	public List<PostsVO> getAll() {
		return dao.findAll();
	}

}