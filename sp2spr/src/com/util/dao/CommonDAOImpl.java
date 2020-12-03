package com.util.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;


@Repository("dao")
public class CommonDAOImpl implements CommonDAO {

	@Autowired
	private SqlMapClientTemplate sqlMapClientTemplate;

	public static CommonDAO getInstance() {
		return new CommonDAOImpl();
	}

	@Override
	public void insertData(String id, Object value) throws SQLException {
		try {			
			sqlMapClientTemplate.getSqlMapClient().startTransaction();
			sqlMapClientTemplate.getSqlMapClient().getCurrentConnection().setAutoCommit(false);
			sqlMapClientTemplate.insert(id,value);
			sqlMapClientTemplate.getSqlMapClient().getCurrentConnection().commit();
		} catch (Exception e) {
			System.out.println(e.toString());
			throw e;
		} finally {
			// 문제가 생기면종료
			sqlMapClientTemplate.getSqlMapClient().getCurrentConnection().setAutoCommit(true);
			sqlMapClientTemplate.getSqlMapClient().endTransaction();
		}
	}

	@Override
	public int updateData(String id, Object value) throws SQLException {
		int result = 0;
		try {
			result = sqlMapClientTemplate.update(id, value);
		} catch (Exception e) {
			System.out.println(e.toString());
			throw e;
		}
		return result;
	}

	@Override
	public int updateData(String id, Map<String, Object> map) throws SQLException {
		int result = 0;
		try {
			result = sqlMapClientTemplate.update(id, map);
		} catch (Exception e) {
			System.out.println(e.toString());
			throw e;
		} 
		return result;
	}

	@Override
	public int deleteData(String id, Object value) throws SQLException {
		int result = 0;
		try {
			result = sqlMapClientTemplate.delete(id, value);
		} catch (Exception e) {
			System.out.println(e.toString());
			throw e;
		}
		return result;
	}

	@Override
	public int deleteData(String id, Map<String, Object> map) throws SQLException {
		int result = 0;
		try {
			result = sqlMapClientTemplate.delete(id, map);
		} catch (Exception e) {
			System.out.println(e.toString());
			throw e;
		}
		return result;
	}

	@Override
	public int deleteAllData(String id) throws SQLException {
		int result = 0;
		try {
			result = sqlMapClientTemplate.delete(id);
		} catch (Exception e) {
			System.out.println(e.toString());
			throw e;
		}
		return result;
	}

	@Override
	public Object getReadData(String id) {
		try {
			return sqlMapClientTemplate.queryForObject(id);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return null;
	}

	@Override
	public Object getReadData(String id, Object value) {
		try {
			return sqlMapClientTemplate.queryForObject(id,value);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return null;
	}

	@Override
	public Object getReadData(String id, Map<String, Object> map) {
		try {
			return sqlMapClientTemplate.queryForObject(id,map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return null;
	}

	@Override
	public int getIntValue(String id) {
		try {
			return ((Integer)sqlMapClientTemplate.queryForObject(id)).intValue();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return 0;
	}

	@Override
	public int getIntValue(String id, Object value) {
		try {
			return ((Integer)sqlMapClientTemplate.queryForObject(id,value)).intValue();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return 0;
	}

	@Override
	public int getIntValue(String id, Map<String, Object> map) {
		try {
			return ((Integer)sqlMapClientTemplate.queryForObject(id,map)).intValue();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return 0;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object> getListData(String id) {
		try {
			return ((List<Object>)sqlMapClientTemplate.queryForList(id));
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object> getListData(String id, Object value) {
		try {
			return ((List<Object>)sqlMapClientTemplate.queryForList(id,value));
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object> getListData(String id, Map<String, Object> map) {
		try {
			return ((List<Object>)sqlMapClientTemplate.queryForList(id,map));
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return null;
	}

}
