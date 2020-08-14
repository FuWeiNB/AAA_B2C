<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/js/jquery-1.8.3.min.js"></script>
<link type="text/css" rel="stylesheet" href="${pageContext.servletContext.contextPath }/assets/css/bootstrap.css">
<%
	request.setAttribute("con", pageContext.getServletContext().getContextPath());
%>