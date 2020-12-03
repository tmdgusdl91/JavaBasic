package com.util.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface CommonDAO {
	/*
	 * 아이바티스를 사용하려면 반드시 인터페이스로 미리 만들어 놔야한다.

	 */
	
	
	//데이터 추가하는 메소드	
	public void insertData(String id, Object value) throws SQLException;
	
	//데이터 수정하는 메소드
	public int updateData(String id, Object value) throws SQLException;
	public int updateData(String id, Map<String, Object>map) throws SQLException;
	
	//데이터 삭제
	public int deleteData(String id, Object value) throws SQLException;
	public int deleteData(String id, Map<String, Object>map) throws SQLException;
	public int deleteAllData(String id) throws SQLException;
	
	//해당 레코드 가져오기
	public Object getReadData(String id);
	public Object getReadData(String id, Object value);
	public Object getReadData(String id, Map<String, Object>map);
	
	//전체 데이터의 갯수
	public int getIntValue(String id);
	public int getIntValue(String id, Object value);
	public int getIntValue(String id, Map<String, Object>map);
	
	//전체 데이터 가져오기
	public List<Object> getListData(String id);
	public List<Object> getListData(String id, Object value);
	public List<Object> getListData(String id, Map<String, Object> map);
}

