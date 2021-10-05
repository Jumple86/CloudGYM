package com.collection.model;

import java.util.List;

public class CollectionService {

	private CollectionDAO_interface dao;

	public CollectionService() {
		dao = new CollectionJDBCDAO();
	}

	public CollectionVO addCollection(Integer userID, Integer menuID, Integer videoID) {

		CollectionVO collectionVO = new CollectionVO();

		collectionVO.setUserID(userID);
		collectionVO.setMenuID(menuID);
		collectionVO.setVideoID(videoID);
		dao.insert(collectionVO);

		return collectionVO;
	}

	public CollectionVO updateCollection(Integer userID, Integer menuID, Integer videoID) {
		CollectionVO collectionVO = new CollectionVO();

		collectionVO.setUserID(userID);
		collectionVO.setMenuID(menuID);
		collectionVO.setVideoID(videoID);
		dao.update(collectionVO);

		return collectionVO;
	}

	public void delete(Integer collectionNo) {
		dao.delete(collectionNo);
	}

	public CollectionVO findByCollectionNo(Integer collectionNo) {
		return dao.findByCollectionNo(collectionNo);
	}

	public List<CollectionVO> getByUserId(Integer userID) {
		return dao.getByUserId(userID);
	}

	public List<CollectionVO> getAll() {
		return dao.getAll();
	}

}
