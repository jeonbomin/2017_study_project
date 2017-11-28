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

import com.java.project.dto.QnaBoard;
import com.java.project.service.qnaService;

@Controller
@RequestMapping("qna")
public class QnaController {
	private static final Logger logger = LoggerFactory.getLogger(QnaController.class);
	@Autowired
	private qnaService qnaSrv;
	
	@RequestMapping(value = "/qnaForm")
	public String qnaForm(Model model,
			@RequestParam(value="keyword", defaultValue="") String keyword,
			@RequestParam(value="curPage", defaultValue="1") String curPage) throws Exception{
		model.addAttribute("list", qnaSrv.getboardlist(curPage,keyword));
		model.addAttribute("navi", qnaSrv.getNavi(curPage,keyword));
		return "forward:/qnaForm";
	}
	//댓글 달기
	@RequestMapping(value = "/qnainsert")
	public String qnainsert(QnaBoard qnaBoard) {
		qnaSrv.qnainsert(qnaBoard);
		
		return "redirect:/qna/qnaForm";
	}
	//답글 달기
	@RequestMapping(value = "/awrapProc")
	public void awrapProc(HttpServletResponse response,QnaBoard qnaBaord) { 
		int result = qnaSrv.awrapProc(qnaBaord);			
		try{PrintWriter out = response.getWriter();
			out.print(result);
		}catch(IOException e){e.printStackTrace();}
	}
}
