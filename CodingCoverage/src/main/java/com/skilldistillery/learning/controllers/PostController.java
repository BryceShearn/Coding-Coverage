package com.skilldistillery.learning.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.skilldistillery.learning.dao.PostDAO;

@Controller
public class PostController {
	
	@Autowired
	PostDAO postDAO;
	
}
