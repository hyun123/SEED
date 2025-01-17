<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<meta charset="UTF-8">
<div class="page_title">
	<span><a class="closeDepth" href="#">closeDepth</a></span> <span
		class="title">근태/연차관리 > <b>일일 근태 관리</b></span>
</div>
<title>일일 근태 등록</title>

<link rel="stylesheet" href="${contextPath}/resources/css/style.css">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>
<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>

<script language="javascript">
	//시트 높이 계산용

	/*Sheet 기본 설정 */
	function LoadPage() {
		mySheet.RemoveAll();
		//아이비시트 초기화
		var initSheet = {};
		initSheet.Cfg = {
			SearchMode : smLazyLoad,
			ToolTip : 1
		};
		initSheet.HeaderMode = {
			Sort : 1,
			ColMove : 1,
			ColResize : 1,
			HeaderCheck : 1
		};
		initSheet.Cols = [ // 상태, 삭제는 건들면 안됨. SaveName은 VO속성과 동일하게
		// MinWidth는 최소 길이값.(줄여도 최소길이값 이하로 안줄여짐.)
		// Align : data 정렬값.
		// keyfield : keyfield값 필수값 체크시 필요(미입력시 추가안됨.)
		// MultiLineText:1  : 하나의 셀에 여러값을 넣을수 있음(shift+enter)
		// Wrap:1 : 데이터
		{
			Header : "상태",
			Type : "Status",
			SaveName : "STATUS",
			MinWidth : 40
		}, {
			Header : "마감",
			Type : "Text",
			SaveName : "Daily_End",
			MinWidth : 30
		}, {
			Header : "삭제",
			Type : "DelCheck",
			SaveName : "DEL_CHK",
			MinWidth : 40
		}, {
			Header : "근무일자",
			Type : "Text",
			SaveName : "pk_DAILY_TA_WORKING_DATE",
			MinWidth : 100
		}, {
			Header : "성명",
			Type : "Text",
			SaveName : "daily_TA_SAWON_NAME",
			MinWidth : 80
		}, {
			Header : "직급",
			Type : "Text",
			SaveName : "daily_TA_RANK",
			MinWidth : 80
		}, {
			Header : "부서",
			Type : "Text",
			SaveName : "daily_TA_DEPT_NAME",
			MinWidth : 80,
			Wrap : 1
		}, {
			Header : "출근시각",
			Type : "Text",
			SaveName : "daily_TA_GO_TIME",
			MinWidth : 60
		}, {
			Header : "퇴근시각",
			Type : "Text",
			SaveName : "daily_TA_OFF_TIME",
			MinWidth : 60
		}, {
			Header : "근무시간",
			Type : "Text",
			SaveName : "daily_TA_WORK_TIME",
			MinWidth : 60
		}, {
			Header : "연장근로",
			Type : "Text",
			SaveName : "daily_TA_EXTEN_WORK",
			MinWidth : 60
		}, {
			Header : "지각시간",
			Type : "Text",
			SaveName : "daily_TA_LATE_TIME",
			MinWidth : 60
		}, {
			Header : "조퇴시간",
			Type : "Text",
			SaveName : "daily_TA_LEAVE_TIME",
			MinWidth : 60
		} ];
		IBS_InitSheet(mySheet, initSheet);
		//mySheet.SetEditable(false);
		//InitSheet.SetRowEditable(5, 1);//5번째 행을 수정할수 있게해줌
		//mySheet.ShowSubSum([{StdCol:"Release",SumCols:"price",Sort:"asc"}]);
		//doAction('search');
		select();
	}

	/*Sheet 각종 처리*/
	function doAction(sAction) {
		switch (sAction) {
		case "search": //조회

			var val1 = "PK_DAILY_TA_WORKING_DATE2="
					+ document.getElementById("pk_DAILY_TA_WORKING_DATE2").value
					+ "&PK_DAILY_TA_WORKING_DATE3="
					+ document.getElementById("pk_DAILY_TA_WORKING_DATE3").value
					+ "&sawon_num="
					+ document.getElementById("sawon_num").value
					+ "&option="
					+ $('#select option:selected').val();
			mySheet.DoSearch("${contextPath}/attendance/p0001/da_searchList.do", val1);
			break;

		case "reload": //초기화
			mySheet.RemoveAll();
			break;

		case "save": // 저장
			mySheet.DoSave("${contextPath}/attendance/p0001/insertData.do");
			break;

		case "insert": //신규행 추가
			var row = mySheet.DataInsert();
			break;

		case "end": //마감관리
			mySheet.SetEditable(true);
		}
	}
	
	function select() {

	    $.ajax({
	             url : "${contextPath}/attendance/p0001/select.do",//목록을 조회 할 url
	             type : "POST",
	             dataType : "JSON",
	             success : function(data) {
	            	 console.log(data);
	            	 /*
	            	 var test1 = document.createElement('option');
	            	 $(test1).prop('value','');
	            	 $(test1).
	            	 $('#select').append();
	            	 */
	                for (var i = 0; i < data.length; i++) {
	   					
	                    var option = "<option class='' value='" + data[i].DEPT_NAME + "'>"
	                    + data[i].DEPT_NAME
	                    + "</option>";
	                   //대상 콤보박스에 추가
	             
	                   $('#select').append(option);
					
	                }  
	            	 var option = "<option class='' value='" + "선택해주세요" + "' disabled selected>"
                    + "선택해주세요"
                    + "</option>";
	            	 $('#select').append(option);
	             },

	             error : function(jqxhr, status, error) {

	                alert("에러");

	             }

	          });

	 };

	// 조회완료 후 처리할 작업
	function mySheet_OnSearchEnd() {

	}

	// 저장완료 후 처리할 작업
	// code: 0(저장성공), -1(저장실패)
	function mySheet_OnSaveEnd(code, msg) {
		if (msg != "") {
			alert(msg);
			//번호 다시 매기기
			//mySheet.ReNumberSeq();
		}
	}
</script>
</head>
<body onload="LoadPage()">
	<div class="exp_product"></div>
	<div class="ib_function float_right">
		<a href="javascript:doAction('insert')" class="f1_btn_gray lightgray">추가</a>
		<a href="javascript:doAction('search')" class="f1_btn_gray lightgray">조회</a>
		<a href="javascript:doAction('save')" class="f1_btn_gray lightgray">저장</a>
		<a href="javascript:doAction('end')" class="f1_btn_gray lightgray">마감</a>
	</div>
<body>
	부서명
	
	<select id="select">
	

	</select> &emsp;근무일자&emsp;
	<input type="Date" name="pk_DAILY_TA_WORKING_DATE2"
		id="pk_DAILY_TA_WORKING_DATE2">&emsp; ~&emsp;
	<input type="Date" name="pk_DAILY_TA_WORKING_DATE3"
		id="pk_DAILY_TA_WORKING_DATE3"> &emsp;사원번호&emsp;
	<input type="text" name="sawon_num" id="sawon_num">
	<div class="page_title"></div>
	<!-- 구분 선 -->
	<br>
	<br>
	<br>

	<div class="clear hidden"></div>
	<div class="ib_product">
		<script>
			createIBSheet("mySheet", "100%", "100%");
		</script>
</body>
</html>




<!-- 1. 부서명
	 2. 값 입력시 자동 계산  
	 3. 마감 처리 -->