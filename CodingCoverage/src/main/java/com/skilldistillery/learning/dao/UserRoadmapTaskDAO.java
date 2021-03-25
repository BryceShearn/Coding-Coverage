package com.skilldistillery.learning.dao;

import java.util.List;

import com.skilldistillery.learning.entities.User;
import com.skilldistillery.learning.entities.UserRoadmapTask;

public interface UserRoadmapTaskDAO {
	
	UserRoadmapTask findById(int urtId);
	
	List<UserRoadmapTask> findByUser(User user);
	
	List<UserRoadmapTask> findAll();
	
	UserRoadmapTask createURT(UserRoadmapTask newUrt, Integer taskId);
	
	UserRoadmapTask updateURT(UserRoadmapTask updatedUrt);
	
	boolean deleteURT(UserRoadmapTask targetUrt);

}
