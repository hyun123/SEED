package hr.human.s0003.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import hr.human.s0003.vo.DeptEnroll_VO;




public interface deptEnroll_DAO {
	public List<DeptEnroll_VO> searchList(Map<String, Object> searchMap) throws DataAccessException;
	 
	public void insertData(Map<String, String> row) throws DataAccessException;

	public void updateData(Map<String, String> row) throws DataAccessException;

	public void deleteData(Map<String, String> row) throws DataAccessException;
	 
}
