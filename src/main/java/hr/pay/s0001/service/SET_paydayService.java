package hr.pay.s0001.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import hr.pay.s0001.vo.SET_paydayVO;





public interface SET_paydayService {
	 public List<SET_paydayVO> searchList(Map<String, Object> searchMap) throws DataAccessException;


	 
	 
	public void saveData(Map<String, String[]> dataMap)  throws DataAccessException ;

	public void updateMember(Map<String, Object> dataMap);

	public void insertMember(Map<String, Object> dataMap);

}
