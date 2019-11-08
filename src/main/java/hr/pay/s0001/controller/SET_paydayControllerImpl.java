package hr.pay.s0001.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import hr.pay.s0001.service.SET_paydayService;
import hr.pay.s0001.vo.SET_paydayVO;




@Controller("SET_paydayController")
public class SET_paydayControllerImpl implements SET_paydayController {
	private static final Logger logger = LoggerFactory.getLogger(SET_paydayControllerImpl.class);
	@Autowired
	SET_paydayService SET_paydayService;
	@Autowired
	SET_paydayVO SET_paydayVO;
	
	@Override
	@RequestMapping(value = "/pay/s0001/init.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		//ModelAndView main = new ModelAndView("hr/p0001_init");
		ModelAndView main = new ModelAndView("pay/s0001/p0001");
		return main;
	}
	
	@Override
	@RequestMapping(value = "/pay/s0001/s0002.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView Calendar(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "pay/s0001/s0002";
		request.setCharacterEncoding("utf-8");
		//ModelAndView main = new ModelAndView("hr/p0001_init");
		ModelAndView main = new ModelAndView(viewName);
		return main;
	}
	
	@Override
	@RequestMapping(value = "/pay/s0001/s0001.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView ibSheet(HttpServletRequest request, HttpServletResponse response) throws Exception {
	request.setCharacterEncoding("utf-8");
		ModelAndView main = new ModelAndView("pay/s0001/s0001");
		return main;
	}
	
	@Override
	@RequestMapping(value = "/popupUsers4SignPath", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView popupUsers4SignPath(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "pay/s0001/popupUsers";
		request.setCharacterEncoding("utf-8");
		//ModelAndView main = new ModelAndView("hr/p0001_init");
		ModelAndView main = new ModelAndView(viewName);
		return main;
	}
	
	
	
	
	
	@Override
	@RequestMapping(value = "/pay/s0001/searchList.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // ?뇦猿볦삕?뜝?럡?돰?댖怨뚰?쀦뤃?
		Map<String, Object> resultMap = new HashMap<String, Object>(); // ?댖怨뚰????뤂?뇦猿됲???沅?
		
		// ?뇦猿볦삕?뜝?럡?돰?댖怨뚰?쀦뤃酉귥삕?땻類㏃삕??젧
		searchMap.put("salary_BO_STA_BANK_CODE", request.getParameter("salary_BO_STA_BANK_CODE"));
		searchMap.put("salary_BO_STA_SAWON_NAME", request.getParameter("salary_BO_STA_SAWON_NAME"));
		searchMap.put("pk_SALARY_BO_STA_SAWON_CODE", request.getParameter("pk_SALARY_BO_STA_SAWON_CODE"));
		searchMap.put("salary_BO_STA_ACC_NUMBER", request.getParameter("salary_BO_STA_ACC_NUMBER"));
		searchMap.put("salary_BO_STA_ACT_PAY", request.getParameter("salary_BO_STA_ACT_PAY"));
		searchMap.put("salary_BO_STA_PAYMENTDAY", request.getParameter("salary_BO_STA_PAYMENTDAY"));

		
		searchMap.put("fk_TA_SAWON_CODE", request.getParameter("fk_TA_SAWON_CODE"));
		searchMap.put("ta_SAWON_NAME", request.getParameter("ta_SAWON_NAME"));
		searchMap.put("ta_PAYMENTDAY", request.getParameter("ta_PAYMENTDAY"));
		searchMap.put("ta_ATTRIBUTION", request.getParameter("ta_ATTRIBUTION"));
		searchMap.put("pk_TA_WORKPLACE_CODE", request.getParameter("pk_TA_WORKPLACE_CODE"));


		//?뜝?럥?몥?뜝?럩逾졾뜝?럡?댉 ?댖怨뚰????뤂
		List<SET_paydayVO> data = SET_paydayService.searchList(searchMap);
        resultMap.put("Data", data);
        
        return resultMap;
	}
	

	
	
	
	
	@Override
	@RequestMapping(value = "/pay/s0001/saveData.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map saveData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, String[]> dataMap = new HashMap<String, String[]>(); // ?뜝?룞?삕?뜝?럩?궋?뜝?럥留덬aa
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 嶺뚳퐣瑗??遊븅뇦猿됲???沅?
		
		// ?뜝?룞?삕?뜝?럩?궋 Data ?鍮딃겫?슧?긷뜝?럥由??뼨?먯삕
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String[] values = request.getParameterValues(name);
			dataMap.put(name, values);
		}
		
		Map<String, String> result = new HashMap<String, String>();
		try {
			SET_paydayService.saveData(dataMap);	
			result.put("Code","0");
			result.put("Message","???옣?릺?뿀?뒿?땲?떎.");
		}catch(Exception e) {
			result.put("Code","-1");
			result.put("Message","?삤瑜섍? 諛쒖깮?븯???뒿?땲?떎.");
			e.printStackTrace();
		}
		
		resultMap.put("Result", result);         
        return resultMap;
	}
	
	private String getViewName(HttpServletRequest request) throws Exception {
		String contextPath = request.getContextPath();
		String uri = (String) request.getAttribute("javax.servlet.include.request_uri");
		if (uri == null || uri.trim().equals("")) {
			uri = request.getRequestURI();
		}

		int begin = 0;
		if (!((contextPath == null) || ("".equals(contextPath)))) {
			begin = contextPath.length();
		}

		int end;
		if (uri.indexOf(";") != -1) {
			end = uri.indexOf(";");
		} else if (uri.indexOf("?") != -1) {
			end = uri.indexOf("?");
		} else {
			end = uri.length();
		}

		String viewName = uri.substring(begin, end);
		if (viewName.indexOf(".") != -1) {
			viewName = viewName.substring(0, viewName.lastIndexOf("."));
		}
		if (viewName.lastIndexOf("/") != -1) {
			viewName = viewName.substring(viewName.lastIndexOf("/",1), viewName.length());
		}
		return viewName;
	}

}