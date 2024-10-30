<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<h2>${category.isEdit ? 'Edit Category' : 'Add New Category'}</h2>

<form action="/admin/categories/save" method="POST" 
		enctype="multipart/form-data">
	<input type="hidden" value="${category.isEdit}" name="isEdit">
			<input type="hidden" value="${category.id}" name="id">
	<label for="categoryname">Category Name:</label><br> 
	<input type="text" name="name" value="${category.name}"><br> 
	<label for="images">Images:</label><br> 
		<img height="150" width="200" src="" id="imagess" />
	<br><input type="text" name="images" value="${category.images}"><br>
	<label for="status">Status:</label><br> 
	<input type="text" name="status" value="${category.status}" ><br>
	
	<c:if test="${category.isEdit}">
	<input type="submit" value="Update">
	</c:if>
	<c:if test="${!category.isEdit}">
	<input type="submit" value="Insert">
	</c:if>
</form>