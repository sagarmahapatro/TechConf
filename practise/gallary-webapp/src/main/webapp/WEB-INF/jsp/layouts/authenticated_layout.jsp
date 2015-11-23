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
	<header>
		<div class="navbar navbar-inverse navbar-fixed-top">
			<div class="navbar-inner">
				<div class="container-fluid">
					<tiles:insertAttribute name="header" />
				</div>
			</div>
		</div>
	</header>
	<article>
		<tiles:insertAttribute name="body" />
	</article>
	<footer>
		<tiles:insertAttribute name="footer" />
	</footer>
	<script
		src="<c:url value="/resources/libs/bootstrap-3.3.5-dist/js/bootstrap.min.js" />"></script>
	<script src="<c:url value="/resources/js/app.js" />"></script>
	<script
		src="<c:url value="/resources/libs/jquery/1.11.2/jquery.min.js" />">
		
	</script>
</body>
</html>