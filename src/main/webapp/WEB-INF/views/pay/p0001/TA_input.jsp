<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/css/style.css"> 
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>
<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>

<script language="javascript">
   var pageheightoffset = 200;

   /*Sheet 기본 설정 */
    function LoadPage() {
      var initData = {};
      initData.Cfg = {SearchMode:smLazyLoad, Page:50,MergeSheet:msHeaderOnly,ChildPage:10,DragMode:1   };
      initData.Cols = [
      //{Header:"No",Type:"Seq", Align:"Center"},
         {Header:"NO",Type:"Seq",SaveName:"Seq", Align:"Center"},
         {Header:"",Type:"DummyCheck", SaveName:"chk", Width:35, Align:"Center",Edit:1,HeaderCheck:1},
       {Header:"사원코드",Type:"Text",SaveName:"fk_TA_SAWON_CODE",Width:60,Align:"Center"},
       {Header:"사원명",Type:"Text",SaveName:"ta_SAWON_NAME",Width:50, Edit:0},
      ];
      IBS_InitSheet(mySheet,initData);
      mySheet.SetDataAutoTrim(0);
      mySheet.SetSumText(1,"총인원");

      
      
      
      
      
      var cfg = {FrozenCol:7,MergeSheet:msHeaderOnly };  
      mySheet2.SetConfig(cfg); 
      
      var header = [
    	  {Text:"근무일별 근태집계|근무일별 근태집계|근무일별 근태집계|근무일별 근태집계|근무일별 근태집계|근무일별 근태집계|근무일별 근태집계",Align:"Center"},
    	  {Text:"NO|상태|삭제|사원코드|구분|일수|시간",Align:"Center"}
    	  ];  
      var info = {Sort:0,ColMove:1,ColResize:1};  
      mySheet2.InitHeaders(header,info);  
      
      var cols = [   
		  {Header:"NO",Type:"Seq",Width:20,SaveName:"pk_TOTAL_CODE", Align:"Center"},
		  {Header:"상태",Type:"Status",SaveName:"STATUS", Align:"Center"},
    	  {Header:"삭제",Type:"DelCheck",Width:60,SaveName:"Delete",Align:"Center"},    
          {Header:"사원코드",Type:"Text",SaveName:"fk_TA_SAWON_CODE",Width:50,Align:"Center"},
    	  {Header:"구분",Type:"Combo", RowSpan:1,SaveName:"ta_DIVI", ComboText:"평일정상근무일|토일정상근무일|주휴정상근무일|유휴정상근무일|무휴정상근무일", ComboCode:"평일정상근무일|토일정상근무일|주휴정상근무일|유휴정상근무일|무휴정상근무일"},          
    	  {Header:"일수",Type:"AutoSum",SaveName:"ta_DAY", MinWidth:10, Align: "Center"},
    	  {Header:"시간",Type:"AutoSum",SaveName:"ta_HOUR", MinWidth:10, Align: "Center"}
   
          ]; 
      mySheet2.InitColumns(cols); 
      mySheet2.SetSumText(1,"합   계");
    
   }


   
   

   w = 640; //팝업창의 너비          //달력정보가져오는 부분
   h = 510; //팝업창의 높이

   //중앙위치 구해오기
   LeftPosition=(screen.width-w)/2;
   TopPosition=(screen.height-h)/2;

   //팝업 호출
   function search1() {
   window.open(
         "calendar.do", "calendar", "width="+w+",height="+h+",top="+TopPosition+",left="+LeftPosition+", scrollbars=no");
   }
   
   function search2() {
      window.open(
         "calendar2.do", "calendar2", "width="+w+",height="+h+",top="+TopPosition+",left="+LeftPosition+", scrollbars=no");
      }
   
   
   function getmonth(frm)
   {
    frm.attribution.value = frm.month.options[frm.month.selectedIndex].text;
    frm.optionValue.value = frm.month.options[frm.month.selectedIndex].value;
   }
   
   
   

   
   
   
   
 



   //드레그 드롭 데이터 이동
   function mySheet2_OnDropEnd(FromSheet, FromRow, ToSheet, ToRow, X, Y, Type) {
      if(FromSheet!=ToSheet&&mySheet.CheckedRows("chk")>1){
                  
         //체크한 행의 데이터를 json형태로 얻음
         var rows = (mySheet.FindCheckedRow("chk")).split("|");
         var rowData = [];
         for(var i=rows.length-1;i>=0;i--){
            //삭제될 데이터를 임시 보관
            rowData.push(FromSheet.GetRowData(rows[i]) );
            //원본 데이터 삭제
            FromSheet.RowDelete(rows[i]);
         }
         
         //드롭 지점의 레벨을 확인
         var lvl = ToSheet.GetRowLevel(ToRow);
         
         //레벨이 부서 이상이면 리턴
         if(lvl<2) return;
         
         //행 데이터 복사(트리임으로 레벨을 고려할 것)
         for(var i=0;i<rowData.length;i++){
            ToSheet.SetRowData(ToRow+1 , rowData[i] ,{Add:1,Level:3} );   
         }
         
      }else{
         //드레그 한 행의 데이터를 json형태로 얻음
         var rowjson = FromSheet.GetRowData(FromRow);
         
         var posRow = FromRow;
         if(FromSheet==ToSheet&&ToRow<FromRow){
            //같은 시트내에서 이동은 신경을 써야 함.   
            posRow++;
         }
         
         //드롭 지점의 레벨을 확인
         var lvl = ToSheet.GetRowLevel(ToRow);
         
         //레벨이 부서 이상이면 리턴
         if(lvl<2) return;
         
         //행 데이터 복사(트리임으로 레벨을 고려할 것)
         ToSheet.SetRowData(ToRow+1 , rowjson ,{Add:1,Level:3} );

         //원본 데이터 삭제
         FromSheet.RowDelete(posRow);
      }
   }
   
  
   
   




   /*Sheet 각종 처리*/
   function doAction(sAction) {
      switch(sAction) {
      case "search": //조회
          var param = "TA_ATTRIBUTION=" + document.getElementById("attribute").value + "&TA_PAYMENTDAY=" + document.getElementById("payday").value+"&TA_INQUIRY_CONDITION=" + document.getElementById("inquiry").value + "&PK_TA_WORKPLACE_CODE=" + document.getElementById("workplace").value;
          

          console.log(param);
         mySheet.DoSearch("${contextPath}/pay/p0001/searchList.do", param);
         
         //mySheet.DoSearch("transaction_data2.json");
         break;
      case "reload": //초기화
         mySheet.RemoveAll();
         mySheet2.RemoveAll();
         break;
      case "save": // 저장
         //var tempStr = mySheet.GetSaveString();
         //alert("서버로 전달되는 문자열 확인 :"+tempStr);
         mySheet2.DoSave("${contextPath}/pay/p0001/saveData.do");
         break;         
      case "insert":
          mySheet2.DataInsert(-1);
          //코드부분 들어가는 코딩
          var select_row = mySheet2.GetSelectRow();
          var col = 3;
          mySheet2.SetCellValue(select_row, col, fk_ta_sawon_code);
          break; 

   }
}
   
   
   
   
   
 
   
// 기타 이벤트 //마우스 클릭시
   function mySheet_OnSelectCell(oldrow,oldcol,row,col) {
      x = "FK_TA_SAWON_CODE=" + mySheet.GetCellValue(row,2);
      console.log(x);
      fk_ta_sawon_code = mySheet.GetCellValue(row,2);
      mySheet2.DoSearch("${pageContext.request.contextPath}/pay/p0001/searchList2.do",x);
   }
   
   

   
   
   
   
   
   
// 조회완료 후 처리할 작업
function mySheet_OnSearchEnd() {
 
}

// 저장완료 후 처리할 작업
// code: 0(저장성공), -1(저장실패)
function mySheet_OnSaveEnd(code,msg){
   if(msg != ""){
      alert(msg);   
      //번호 다시 매기기
       //mySheet.ReNumberSeq();
   }   
}   
   
   //버튼을 이용한 이동
   function move(to){
      var ToSheet,FromSheet;
      if(to=="toRight"){
         ToSheet = mySheet2;
         FromSheet = mySheet;

         //복사될 위치를 구한다.
         var ToRow = ToSheet.GetSelectRow();
         if(ToSheet.GetRowLevel(ToRow)<2){
            alert("오른쪽 시트에서 붙여넣을 팀을 선택해 주세요");
            return;
         }
         //원본 시트에 복사할 데이터 추출
         var data = FromSheet.GetSaveJson({StdCol:"chk"});
         //대상 시트에 데이터 복사
         ToSheet.LoadSearchChildData(ToRow,data,{Append: 1, WaitDlg: 1});
         
         //체크된 행이 있는지 찾아본다.
         var rows = FromSheet.FindCheckedRow("chk");
         
         //원본 데이터 삭제
         FromSheet.RowDelete(rows);
         
      }else{ //toLeft
         //반대방향으로 이동하는 것은 시트 모양이 안예뻐서 안 만들었음.
         ToSheet = mySheet;
         FromSheet = mySheet2;
      }   
   }
   

   
   
   
   
   
   
   
   
   
   
   
   

   
</script>

<body onload="LoadPage()">
  <div class="page_title">
    <span><a class="closeDepth" href="#">closeDepth</a></span> 
    <span class="title">급여/퇴직정산관리> <b>근태결과입력</b></span>
  </div>
  <div class="main_content">
       <div class="exp_product"></div>
       <div class="exp_product">
         
      </div>
      <div class="ib_function float_right">
         <a href="javascript:doAction('reload')" class="f1_btn_gray lightgray">초기화</a>
         <a href="javascript:doAction('insert')" class="f1_btn_gray lightgray">추가</a>
         <a href="javascript:doAction('search')" class="f1_btn_white gray">조회</a>
          <a href="javascript:doAction('save')" class="f1_btn_white gray">저장</a>
         </div>
         <br>      <br>
         
         <div>
                 
          <form name="thisform1" onsubmit="return false;">
           귀속연월&ensp;<input type="text" id="attribute" size="20">
               <input type="image" name="submit" onclick="javascript:search1()" src="${pageContext.request.contextPath}/resources/image/searchbutton.png">
                   </form>
                       &emsp;&emsp; 
                   
                   <form name="thisform2" onsubmit="return false;" > 
               지급일&ensp;<input type="text" id="payday" size="20">
               <input type="image" name="submit" onclick="javascript:search2()" src="${pageContext.request.contextPath}/resources/image/searchbutton.png">
                              </form>  
      
         <br><br>
         
          
              &emsp;&emsp;&emsp;&emsp;&emsp;조회조건&ensp;<select name="inquiry" id="inquiry">
                      <option value="사업장">사업장</option>
                       <option value="부서">부서</option>
                           </select>
         &ensp;&emsp;&emsp; &emsp;&emsp; &emsp; &emsp;&emsp;&emsp;
   
                     사업장&ensp;<select name="workplace" id="workplace">
                      <option value="본사">본사</option>
                       <option value="대리점">대리점</option>
                           </select>             
                  
             
             
         
             </div>
             
             </div>
   




<br><br>
      <div class="clear hidden"></div>
      <!-- left단 사원리스트 -->
              <DIV class="ib_product" style="width:100%;float:left">
				<div style="height:100%;width:45%;float:left">
					<script type="text/javascript"> createIBSheet("mySheet", "100%", "100%"); </script>
				</div>
			
				
				<div style="height:100%;width:45%;float:left">
					<script type="text/javascript"> createIBSheet("mySheet2", "100%", "100%"); </script>
				</div>
			</div>
               
      
        
        <!--right단 정보입력 및 수정단 -->
      
      
 
          
   
    <!--main_content-->

</body>
</html>