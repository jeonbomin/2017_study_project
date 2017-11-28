package com.java.project.service;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.project.QnaController;
import com.java.project.dao.QnaBoardDAO;
import com.java.project.dto.QnaBoard;
import com.java.project.util.PageService;

@Service("qnaService")
public class qnaServiceImpl implements qnaService {
	private static final Logger logger = LoggerFactory.getLogger(qnaServiceImpl.class);
	@Autowired
	private QnaBoardDAO boardDao; 
	
	private final int BLOCKSIZE = 7;
	private final String NAVIURL="/project/qna/qnaForm";
	private final String CURRENTPAGE = "curPage=";
	private final String SEARCHWORD = "searchWord=";
	
	@Override
	public List<QnaBoard> getboardlist(String curPage,String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();	
		int pageNum=0;
		if(curPage!=null) pageNum = Integer.parseInt(curPage)-1;
		map.put("start", pageNum * BLOCKSIZE);
		map.put("end", (pageNum+1) * BLOCKSIZE);
		map.put("keyword", keyword);
		return boardDao.getboardlist(map);
	}

	@Override
	public void qnainsert(QnaBoard qnaBoard) {
		boardDao.qnainsert(qnaBoard);
	}

	@Override
	public int awrapProc(QnaBoard qnaBoard) {
		try {boardDao.awrapProc(qnaBoard);return 1;
		}catch(Exception e){return 0;}
	}

	@Override
	public String getNavi(String curPage, String keyword) throws Exception {
		int pageNum = Integer.parseInt(curPage);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		
		return PageService.getNavi(pageNum, BLOCKSIZE, 
				boardDao.selectBoardCnt(map), 
				NAVIURL+"?"+
				SEARCHWORD + URLEncoder.encode(keyword, "UTF-8") +"&"+CURRENTPAGE
				);
	}
}
