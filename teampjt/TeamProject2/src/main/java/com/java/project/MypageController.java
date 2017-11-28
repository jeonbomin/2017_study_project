package com.java.project;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.java.project.dto.Member;
import com.java.project.dto.QnaBoard;
import com.java.project.service.mypageService;
import com.java.project.service.qnaService;

@Controller
@RequestMapping("mypage")
public class MypageController {
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	@Autowired
	private mypageService mpSrv;
	
	@RequestMapping(value = "/mypageForm")
	public String mypageForm(Model model){
		model.addAttribute("email",mpSrv.mypageForm("aaaadddd"));
		return "forward:/mypageForm";
	}
	
	@RequestMapping(value = "/editpw")
	public void editpw(HttpServletResponse response
			,@RequestParam("edit_id")String edit_id
			,@RequestParam("edit_pw")String edit_pw) { 
		int result = mpSrv.editpw(edit_id,edit_pw);			
		try{PrintWriter out = response.getWriter();
			out.print(result);
		}catch(IOException e){e.printStackTrace();}
	}
	@RequestMapping(value = "/editProc")
	public void editProc(@RequestParam(value="edit_email", defaultValue="")String edit_email,
			@RequestParam("edit_email2")String edit_email2,
			@RequestParam("nwpw")String nwpw,@RequestParam("edit_id")String edit_id,HttpServletResponse response) { 
		String result = mpSrv.editProc(edit_id,nwpw,edit_email,edit_email2);
		try{PrintWriter out = response.getWriter();
		out.print(result);
	}catch(IOException e){e.printStackTrace();}
	}
}
