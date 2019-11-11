<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>Employee Input Page</h4>
	
	<s:form action="emp-save" method="post">
		<s:textfield name="lastName" label="LastName"></s:textfield>
		<s:textfield name="email" label="Email"></s:textfield>
		<s:textfield name="birth" label="Birth"></s:textfield>
		<s:select list="#request.departments" listKey="id" listValue="departmentName" name="department.id" label="Department"></s:select>
		<s:submit value="提交"></s:submit>
	</s:form>
</body>
</html>