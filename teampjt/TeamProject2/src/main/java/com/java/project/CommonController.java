package com.java.project;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommonController {
	
	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);
	
	@RequestMapping(value = "/")
	public String index() {
		return "redirect:/home";
	}
	@RequestMapping(value = "/{formPath}")
	public String indexForm(
			@PathVariable("formPath") String formPath,
			Model model) {
		model.addAttribute("formPath", formPath);
		return "index";
	}
	@RequestMapping(value = "/form/{formPath}")
	public String moveForm(
			@PathVariable("formPath") String formPath) {
		return "/form/"+formPath;
	}
	
	@RequestMapping(value = "/footer")
	public String footer() {return "common/footer";}
	@RequestMapping(value = "/top")
	public String top() {return "common/top";}
	@RequestMapping(value = "/Login")
	public String Login() {
		return "form/login/loginForm";
	}
	@RequestMapping(value = "/join")
	public String join() {
		return "form/login/membershipForm";
	}
	
}
