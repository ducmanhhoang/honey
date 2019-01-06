<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<ul>
	<li class="dropdown"><a href="javascript:void(0)" class="dropbtn">Sản phẩm</a>
		<div class="dropdown-content">
			<a href="${pageContext.request.contextPath}/samsung/warehouse/user/category/category.do">Quản lý danh mục</a> 
			<a href="${pageContext.request.contextPath}/samsung/warehouse/user/product/product.do">Quản lý sản phẩm</a> 
			<a href="${pageContext.request.contextPath}/samsung/warehouse/user/unit/unit.do">Quản lý đơn vị tính</a> 
			<a href="${pageContext.request.contextPath}/samsung/warehouse/user/product/inventory.do">Hiện trạng tồn kho</a>
		</div>
	</li>
	<li class="dropdown">
		<a href="${pageContext.request.contextPath}/samsung/warehouse/user/partner/partner.do" class="dropbtn">Quản lý đối tác</a></li>
	<li class="dropdown"><a href="javascript:void(0)" class="dropbtn">Hóa đơn</a>
		<div class="dropdown-content">
			<a href="${pageContext.request.contextPath}/samsung/warehouse/user/invoice/impInvoice.do">Lập hóa đơn nhập</a> 
			<a href="${pageContext.request.contextPath}/samsung/warehouse/user/invoice/impInvoiceManagement.do">Quản lý hóa đơn nhập</a> 
			<a href="${pageContext.request.contextPath}/samsung/warehouse/user/invoice/expInvoice.do">Lập hóa đơn xuất</a> 
			<a href="${pageContext.request.contextPath}/samsung/warehouse/user/invoice/expInvoiceManagement.do">Quản lý hóa đơn xuất</a> 
			<a href="${pageContext.request.contextPath}/samsung/warehouse/user/invoice/returnInvoice.do">Lập hóa đơn trả lại</a> 
			<a href="${pageContext.request.contextPath}/samsung/warehouse/user/invoice/returnInvoiceManagement.do">Quản lý hóa đơn trả lại</a>
		</div>
	</li>
	<li class="dropdown"><a href="javascript:void(0)" class="dropbtn">Quản lý hệ thống</a>
		<div class="dropdown-content">
			<a href="${pageContext.request.contextPath}/user.html">Quản lý người sử dụng</a> 
		</div>
	</li>
	<li><a href="<c:url value="/public.do" />">Home</a></li>
	<li><a href="<c:url value="/logout.do" />">Logout</a></li>
	<li><strong>${user}|${role}</strong></li>
</ul>