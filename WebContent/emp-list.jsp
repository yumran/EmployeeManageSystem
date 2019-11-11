<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="scripts/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		//1、点击delete 时，弹出确定是要删除 XX 的信息吗? 若确定，执行删除，若不确定，则取消
		$(".delete").click(function(){
			var lastName = $(this).next(":input").val();
			var flag = confirm("确定要删除  "+lastName+" 的信息吗?");
			if(flag){
				var $tr = $(this).parent().parent();
				//删除，使用ajax 的方式
				var url = this.href;
				var args = {"time":new Date()};
				$.post(url,args,function(data){
					//若data的返回值为1，则提示 删除成功，且把当前行删除
					if(data == "1"){
						alert("删除成功！");
						$tr.remove();
					}else{
						//若data 的返回值不是1 ,提示删除失败
						alert("删除失败！");
					}
				});
			}
			
			//取消超链接的默认行为
			return false;
		});	
	})
	
	
</script>
</head>
<body>
	<h4>Employee List Page</h4>
	
	<s:if test="#request.employees==null||#request.employees.size()==0">
		沒有任何員工信息
	</s:if>
	<s:else>
		<table border="1" style="cellpadding:10;cellspacing:0;">
			<tr>
				<td>ID</td>
				<td>LASTNAME</td>
				<td>EMAIL</td>
				<td>BIRTH</td>
				<td>CREATETIME</td>
				<td>DEPARTMENT</td>
				<td>DELETE</td>
			</tr>
			<s:iterator value="#request.employees" status="stuts">
				<tr>
					<td><s:property value="#stuts.count"/></td>  
					<%-- <td>${id }</td> --%>
					<td>${lastName }</td>
					<td>${email }</td>
					<td>
						<s:date name="birth" format="yyyy-MM-dd"/>
					</td>
					<td>
						<s:date name="createTime" format="yyyy-MM-dd hh:mm:ss"/>
					</td>
					<td>${department.departmentName }</td>
					<td>
						<a href="emp-delete?id=${id }" class="delete">delete</a>
						<input type="hidden" value="${lastName }"/>
					</td>
				</tr>
				
			</s:iterator>
			
		</table>
	</s:else>
</body>
</html>