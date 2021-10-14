package com.coachMenu.model;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

public class CoachMenuService {
	private CoachMenuDAO_interface dao;
	SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String str = sd.format(new Date(System.currentTimeMillis()));
	Timestamp ts = Timestamp.valueOf(str);
	
	public CoachMenuService() {
		dao = new CoachMenuJDBCDAO();
	}
	
	public CoachMenuVO addCoachMenu(Integer userID, String menuName, Integer price, Boolean isPublic) {
		CoachMenuVO coachMenuVO = new CoachMenuVO();
		
		coachMenuVO.setUserID(userID);
		coachMenuVO.setMenuName(menuName);
		coachMenuVO.setPrice(price);
		coachMenuVO.setIsPublic(isPublic);
		dao.insert(coachMenuVO);
		return coachMenuVO;
	}
	
	public CoachMenuVO updateCoachMenu(Integer userID, String menuName, Integer price, Boolean isPublic, Integer menuID){
		CoachMenuVO coachMenuVO = new CoachMenuVO();
		
		coachMenuVO.setUserID(userID);
		coachMenuVO.setMenuName(menuName);
		coachMenuVO.setPublishDate(ts);
		coachMenuVO.setPrice(price);
		coachMenuVO.setIsPublic(isPublic);
		coachMenuVO.setMenuID(menuID);
		dao.update(coachMenuVO);
		return coachMenuVO;
	}
	
	public void deleteCoachMenu(Integer menuID) {
		dao.delete(menuID);
	}
	
	public CoachMenuVO getByMenuID(Integer menuID) {
		return dao.findByMenuID(menuID);
	}
	
	public List<CoachMenuVO> getByUserID(Integer userID){
		return dao.findByUserID(userID);
	}
	
	public List<CoachMenuVO> getAll(){
		return dao.findAll();
	}
}
