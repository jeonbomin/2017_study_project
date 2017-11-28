package com.java.project.dao;

import java.util.Map;

public interface mypageDAO {
	public String mypageForm(String id);
	public int editpw(Map<String, Object> map);
	public void editProc(Map<String, Object> map);
}
