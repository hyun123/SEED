<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title><s:message code="common.pageTitle"/></title>
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin/metisMenu.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin/sb-admin-2.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <script src="${pageContext.request.contextPath}/resources/js/jquery-2.2.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/css/sb-admin/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/css/sb-admin/metisMenu.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/css/sb-admin/sb-admin-2.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/project9.js"></script>    
<script>
</script>    
</head>

<body>

    <div id="wrapper">

        <div id="page-wrapper" style="margin: 0px;">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header"><i class="fa fa-gear fa-fw"></i> <s:message code="common.codecd"/></h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
            <!-- /.row -->
            <div class="row">
				<div class="panel panel-default">
	                    <div class="panel-body">
	                    	<div class="row">
	                            <label class="col-lg-2"><s:message code="common.classno"/></label>
	                            <div class="col-lg-1"><c:out value="${codeInfo.CLASSNO}"/></div>
	                        </div>
	                    	<div class="row">
	                            <label class="col-lg-2"><s:message code="common.codecd"/></label>
	                            <div class="col-lg-1"><c:out value="${codeInfo.CODECD}"/></div>
	                        </div>
	                    	<div class="row">
	                            <label class="col-lg-2"><s:message code="common.codenm"/></label>
	                            <div class="col-lg-5"><c:out value="${codeInfo.CODENM}"/></div>
	                        </div>
	                    </div>
                </div>
                <button class="btn btn-outline btn-primary" onclick="fn_moveToURL('adCodeList')" ><s:message code="common.btnList"/></button>
                <button class="btn btn-outline btn-primary" onclick="fn_moveToURL('adCodeDelete?CLASSNO=<c:out value="${codeInfo.CLASSNO}"/>&CODECD=<c:out value="${codeInfo.CODECD}"/>', '<s:message code="common.btnDelete"/>')" ><s:message code="common.btnDelete"/></button>
                <button class="btn btn-outline btn-primary" onclick="fn_moveToURL('adCodeForm?CLASSNO=<c:out value="${codeInfo.CLASSNO}"/>&CODECD=<c:out value="${codeInfo.CODECD}"/>')" ><s:message code="common.btnUpdate"/></button>
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
</body>

</html>
