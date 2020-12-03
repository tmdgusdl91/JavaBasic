package com.util.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface CommonDAO {
	/*
	 * ���̹�Ƽ���� ����Ϸ��� �ݵ�� �������̽��� �̸� ����� �����Ѵ�.

	 */
	
	
	//������ �߰��ϴ� �޼ҵ�	
	public void insertData(String id, Object value) throws SQLException;
	
	//������ �����ϴ� �޼ҵ�
	public int updateData(String id, Object value) throws SQLException;
	public int updateData(String id, Map<String, Object>map) throws SQLException;
	
	//������ ����
	public int deleteData(String id, Object value) throws SQLException;
	public int deleteData(String id, Map<String, Object>map) throws SQLException;
	public int deleteAllData(String id) throws SQLException;
	
	//�ش� ���ڵ� ��������
	public Object getReadData(String id);
	public Object getReadData(String id, Object value);
	public Object getReadData(String id, Map<String, Object>map);
	
	//��ü �������� ����
	public int getIntValue(String id);
	public int getIntValue(String id, Object value);
	public int getIntValue(String id, Map<String, Object>map);
	
	//��ü ������ ��������
	public List<Object> getListData(String id);
	public List<Object> getListData(String id, Object value);
	public List<Object> getListData(String id, Map<String, Object> map);
}

