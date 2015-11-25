<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<head>
<link
	href="<c:url value="/resources/libs/bootstrap-3.3.5-dist/css/bootstrap.css" />"
	rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/css/app.css" />" rel="stylesheet"
	type="text/css" />

<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
	    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	  <![endif]-->
</head>


<body>
	<!-- 	<div class="app-header"> -->
	<%-- 		<tiles:insertAttribute name="header" /> --%>
	<!-- 	</div> -->
	<!-- 	<div class="app-body"> -->
	<%-- 		<tiles:insertAttribute name="body" /> --%>
	<!-- 	</div> -->
	<!-- 	<div class="app-footer"> -->
	<%-- 		<tiles:insertAttribute name="footer" /> --%>
	<!-- 	</div> -->
	<div id="outer_box">
		<div id="new_box_1">BOX 1</div>
		<div id="new_box_2">BOX 2</div>
		<div id="new_box_3">BOX 3</div>
		<div id="new_box_4">BOX 4</div>
		<div id="new_box_5">BOX 5</div>
	</div>


	<script
		src="<c:url value="/resources/libs/jquery/1.11.2/jquery.min.js" />">
		
	</script>
	<script
		src="<c:url value="/resources/libs/bootstrap-3.3.5-dist/js/bootstrap.min.js" />"></script>
	<script src="<c:url value="/resources/js/app.js" />"></script>
</body>
</html>