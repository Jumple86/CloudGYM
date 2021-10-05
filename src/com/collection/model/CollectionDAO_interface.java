package com.collection.model;

import java.util.List;

public interface CollectionDAO_interface {
	void insert(CollectionVO collectionVO);
	void update(CollectionVO collectionVO);
	void delete(Integer collectionNo);
	CollectionVO findByCollectionNo(Integer collectionNo); 
	List<CollectionVO> getByUserId(Integer userID);
	List<CollectionVO> getAll();
}
