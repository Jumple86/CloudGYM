package com.report.model;

import java.sql.Timestamp;
import java.util.List;

public class ReportService {
	
	private ReportDAO_interface dao;
	
	public ReportService() {
		dao = new ReportJDBCDAO();
	}
	
	public ReportVO addReport(Integer reportID,Integer userID,Integer itemID,Timestamp reportTime) {
		
		ReportVO reportVO = new ReportVO();
		reportVO.setUserID(userID);
		reportVO.setItemID(itemID);
		reportVO.setReportTime(reportTime);
		dao.insert(reportVO);
		return reportVO;
	}
	
	public void deleteReport(Integer userID,Integer itemID) {
		ReportVO reportVO = new ReportVO();
		reportVO.setUserID(userID);
		reportVO.setItemID(itemID);
		dao.delete(reportVO);
	}
	
	public List<ReportVO> getByUser(Integer userID) {
		return dao.findbyUserID(userID);
	}
	
	public List<ReportVO> getByItem(Integer itemID) {
		return dao.findbyItemID(itemID);
	}
	
	public List<ReportVO> findAll(){
		return dao.findAll();
	}

}
