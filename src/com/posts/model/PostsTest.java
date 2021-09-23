package com.posts.model;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;

public class PostsTest {
	
	public static void main(String[] args) throws IOException {
		PostsJDBCDAO dao = new PostsJDBCDAO();

//		 新增
//		PostsVO postsVO = new PostsVO();
//		postsVO.setPostsID(40011);
//		postsVO.setUserID(1002);
//		postsVO.setPostsTitle("ABCD");
//		postsVO.setPostsContent("DCBA");
//		postsVO.setPostsImg(getPictureByteArray("Test_Img/img.png"));
//		postsVO.setPostsPublishDate(java.sql.Timestamp.valueOf("2021-01-01 11:11:11"));
//		postsVO.setTagID(20);
//		postsVO.setPostsShow(true);
//		dao.insert(postsVO);
//		System.out.println("新增成功");

//		修改
//		PostsVO postsVO = new PostsVO();
//		postsVO.setPostsTitle("ABCDAAAAA");
//		postsVO.setPostsContent("DCBAAAAA");
//		postsVO.setPostsImg(getPictureByteArray("Test_Img/img2.jpg"));
//		postsVO.setPostsPublishDate(java.sql.Timestamp.valueOf("2021-02-02 22:22:22"));
//		postsVO.setTagID(30);
//		postsVO.setPostsShow(false);
//		postsVO.setPostsID(40011);
//		dao.update(postsVO);
//		System.out.println("修改成功");
		
//		 刪除
//		dao.delete(40011);
//		System.out.println("刪除成功");

		
//		 查詢PK
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
