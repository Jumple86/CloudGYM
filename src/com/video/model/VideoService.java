package com.video.model;

import java.io.InputStream;
import java.sql.Timestamp;
import java.util.List;

public class VideoService {
	private VideoDAO_interface dao;
	
	public VideoService() {
		dao = new VideoJDBCDAO();
	}

	public VideoVO add(Integer userID, String title, Integer price, String intro, byte[] img, InputStream content, String level, Integer duration, Boolean listed, Integer reportedTimes, Timestamp publishTime) {
		VideoVO videoVO = new VideoVO();
		videoVO.setUserID(userID);
		videoVO.setTitle(title);
		videoVO.setPrice(price);
		videoVO.setIntro(intro);
		videoVO.setImg(img);
		videoVO.setContent(content);
		videoVO.setLevel(level);
		videoVO.setDuration(duration);
		videoVO.setListed(listed);
		videoVO.setReportedTimes(reportedTimes);
		videoVO.setPublishTime(publishTime);
		dao.add(videoVO);
		return videoVO;
	}

	public VideoVO update(String title, Integer price, String intro, byte[] img, InputStream content, String level , Integer videoID) {
		VideoVO videoVO = new VideoVO();
		videoVO.setTitle(title);
		videoVO.setPrice(price);
		videoVO.setIntro(intro);
		videoVO.setImg(img);
		videoVO.setContent(content);
		videoVO.setLevel(level);
		videoVO.setVideoID(videoID);
		dao.update(videoVO);
		return videoVO;
	}
	
	public VideoVO update(VideoVO videoVO) {
		dao.update(videoVO);
		return videoVO;
	}

	public void delete(Integer videoID) {
		dao.delete(videoID);
	}

	public VideoVO findByPrimaryKey(Integer videoID) {
		return dao.findByPrimaryKey(videoID);
	}
	
	public List<VideoVO> getByUserID(Integer userID){
		return dao.findByUserID(userID);
	}

	public List<VideoVO> getAll() {
		return dao.getAll();
	}
	
	public List<VideoVO> getAll2(){
		return dao.getAll2();
	}
}
