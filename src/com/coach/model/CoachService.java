package com.coach.model;

import java.sql.Date;
import java.util.List;

public class CoachService {
	
	private CoachDAO_interface dao;
	
	public CoachService() {
		dao = new CoachJDBCDAO();
	}
	
	public CoachVO addCoach
	(Integer userID,String coachAccount,String coachName,String coachPassword,byte[] coachImg,String coachSex,Date coachBirthday,String coachDescription,Date coachRegisteredDate,String coachCertificate,Integer reportedTimes) {
		CoachVO coachVO = new CoachVO();
		
		coachVO.setUserID(userID);
		coachVO.setCoachAccount(coachAccount);
		coachVO.setCoachName(coachName);
		coachVO.setCoachPassword(coachPassword);
		coachVO.setCoachImg(coachImg);
		coachVO.setCoachSex(coachSex);
		coachVO.setCoachBirthday(coachBirthday);
		coachVO.setCoachDescription(coachDescription);
		coachVO.setCoachRegisteredDate(coachRegisteredDate);
		coachVO.setCoachCertificate(coachCertificate);
		coachVO.setReportedTimes(reportedTimes);
		
		dao.insert(coachVO);
		
		return coachVO;
	}
	
	public void addCoach(CoachVO coachVO) {
		dao.insert(coachVO);
	}
	
	public CoachVO updateCoach
	(Integer userID,String coachAccount,String coachName,String coachPassword,byte[] coachImg,String coachSex,Date coachBirthday,String coachDescription,Date coachRegisteredDate,String coachCertificate,Integer reportedTimes) {
		CoachVO coachVO = new CoachVO();
		
		coachVO.setUserID(userID);
		coachVO.setCoachAccount(coachAccount);
		coachVO.setCoachName(coachName);
		coachVO.setCoachPassword(coachPassword);
		coachVO.setCoachImg(coachImg);
		coachVO.setCoachSex(coachSex);
		coachVO.setCoachBirthday(coachBirthday);
		coachVO.setCoachDescription(coachDescription);
		coachVO.setCoachRegisteredDate(coachRegisteredDate);
		coachVO.setCoachCertificate(coachCertificate);
		coachVO.setReportedTimes(reportedTimes);
		
		dao.update(coachVO);
		
		return coachVO;
	}
	
	public void updateCoach(CoachVO coachVO) {
		dao.update(coachVO);
	}
	
	public void deleteCoach(Integer userID) {
		dao.delete(userID);
	}
	
	public CoachVO getByUserID(Integer userID) {
		return dao.findByUserID(userID);
	}
	
	public List<CoachVO> getAll() {
		return dao.findAll();
	}
}
