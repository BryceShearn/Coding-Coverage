package com.skilldistillery.learning.dao;

import java.util.List;

import com.skilldistillery.learning.entities.Post;
import com.skilldistillery.learning.entities.Resource;
import com.skilldistillery.learning.entities.User;

public interface PostDAO {
	
	Post findById(int postId);
	
	List<Post> findByUser(User user);
	
	List<Post> findAll();
	
	Post createPost(Post newPost);
	
	Post updatePost(Post updatedPost);
	
	boolean deletePost(Post targetPost);
	
	List<Post> filterByLanguageAndKeyword(String keyword, Integer languageId);
	
	Post viewPost(int postId); 

}
