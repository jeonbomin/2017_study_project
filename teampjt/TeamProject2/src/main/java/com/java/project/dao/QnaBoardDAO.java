package com.java.project.dao;

import java.util.List;
import java.util.Map;

import com.java.project.dto.QnaBoard;

public interface QnaBoardDAO {
	public List<QnaBoard> getboardlist(Map<String, Object> map);
	public int selectBoardCnt(Map<String, Object> map);
	public void qnainsert(QnaBoard qnaBoard);
	public void awrapProc(QnaBoard qnaBoard);
}
