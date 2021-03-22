package com.skilldistillery.learning.dao;

import java.util.List;

import com.skilldistillery.learning.entities.Language;
import com.skilldistillery.learning.entities.Resource;

public interface ResourceDAO {
	
	List<Resource> findAll();
	
	List<Resource> filterByLanguageAndKeyword(String keyword, Language language);
}
