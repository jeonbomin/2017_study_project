package com.java.project.service;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.java.project.dao.mypageDAO;

@Service("mypage")
public class mypageServiceImpl implements mypageService {
	private static final Logger logger = LoggerFactory.getLogger(mypageServiceImpl.class);
	@Autowired
	private mypageDAO mpDao;
	
	@Override
	public String mypageForm(String id) {
		return mpDao.mypageForm(id);
	}
	
	@Override
	public int editpw(String edit_id, String edit_pw) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("edit_id", edit_id);
		map.put("edit_pw", edit_pw);
		if(mpDao.editpw(map) == 0) {return 0;}
		else{return 1;}
	}

	@Override
	public String editProc(String edit_id, String nwpw, String edit_email, String edit_email2) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("edit_id", edit_id);
		map.put("nwpw", nwpw);
		map.put("edit_email", edit_email);
		map.put("edit_email2", edit_email2);
		mpDao.editProc(map);
		return "success";
	}
}
