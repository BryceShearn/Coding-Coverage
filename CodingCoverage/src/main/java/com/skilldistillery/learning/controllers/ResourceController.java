package com.skilldistillery.learning.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.learning.dao.ResourceDAO;
import com.skilldistillery.learning.entities.Language;

@Controller
public class ResourceController {

	@Autowired
	private ResourceDAO resourceDao;
	
	@RequestMapping(path= "Resources.do")
	public String resources(Model model) {
		model.addAttribute("resources", resourceDao.findAll());
		return "results/Resources";
	}
	
	@RequestMapping(path = "SearchFilter.do", params= {"keyword", "language_id"})
	public String resourcesSearchFilter(String keyword, @RequestParam("language_id")Integer languageId, Model model) {
		model.addAttribute("resources", resourceDao.filterByLanguageAndKeyword(keyword, languageId));
		return "results/Resources";
	}
}
