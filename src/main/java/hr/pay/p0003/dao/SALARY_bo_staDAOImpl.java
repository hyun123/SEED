package hr.pay.p0003.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;


import hr.pay.p0003.vo.SALARY_bo_staVO;






@Repository("SALARY_bo_staDAO")
public class SALARY_bo_staDAOImpl implements SALARY_bo_staDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<SALARY_bo_staVO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		System.out.println("3. "+searchMap);
		List<SALARY_bo_staVO> list = sqlSession.selectList("hr.pay.p0003.searchList", searchMap);
		return list;
	}
	


	@Override
	public void insertData(Map<String, String> row) throws DataAccessException {
		System.out.println("1."+row);
		sqlSession.update("hr.pay.p0003.insertData", row);
	}

	@Override
	public void updateData(Map<String, String> row) throws DataAccessException {
		System.out.println("save:"+row);
		sqlSession.update("hr.pay.p0003.updateData", row);
	}

	@Override
	public void deleteData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hr.pay.p0003.deleteData", row);
	}

}
