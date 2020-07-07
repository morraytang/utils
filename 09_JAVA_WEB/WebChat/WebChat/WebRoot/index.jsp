<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<!-- 任何一个需要页面聊天室的网站，只需要在页面上导入此聊天室脚本 -->
  	<script type="text/javascript" src="dynachat.js"></script>
  	
  	</head>
  
  <body>
    欢迎来到聊天室！<br>
    <form action="/WebChat/servlet/ValidateServlet" method="post">
    	<table border="1">
    		<tr>
    			<td>用户名：</td>
    			<td><input type="text" name="name" /></td>
    		</tr>
    		<tr>
    		<td colspan="2" ><div align="center"><input type="submit" value="登陆"/></div></td>
    		</tr>
    	</table>
    </form>
  </body>
</html>
