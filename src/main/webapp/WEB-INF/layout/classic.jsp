<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title><tiles:getAsString name="title" /></title>
	
	<!-- Default header name is X-CSRF-TOKEN -->
	<meta name="_csrf" content="${_csrf.token}" />
	<meta name="_csrf_header" content="${_csrf.headerName}" />
	
	<!-- CSS AND JS -->
	<link href="${pageContext.request.contextPath}/resources/css/menu/menu.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/axisj-1.1.11/ui/arongi/AXJ.min.css" rel="stylesheet">
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/axisj-1.1.11/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/axisj-1.1.11/dist/AXJ.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/axisj-1.1.11/lib/AXSelect.js"></script>
</head>
 
<body>
		<header id="header">
			<tiles:insertAttribute name="header" />
		</header>
	
		<section id="sidemenu">
			<tiles:insertAttribute name="menu" />
		</section>
			
		<section id="site-content">
			<tiles:insertAttribute name="body" />
		</section>
		
		<footer id="footer">
			<tiles:insertAttribute name="footer" />
		</footer>
</body>
</html>