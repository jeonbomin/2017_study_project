package com.java.project.service;

import java.util.List;

import com.java.project.dto.QnaBoard;

public interface qnaService {
	public List<QnaBoard> getboardlist(String curPage,String keyword);
	public void qnainsert(QnaBoard qnaBoard);
	public int awrapProc(QnaBoard qnaBoard);
	public String getNavi(String curPage, String keyword) throws Exception;
}
