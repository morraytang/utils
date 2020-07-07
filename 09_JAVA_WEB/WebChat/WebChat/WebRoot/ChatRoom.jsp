<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ChatRoom.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <script>
  var myAjaxObject;
  var autoAjaxObject;
  
  var no = 0;
  document.onkeydown= changeFocus  ;
  
  function create(){
  	
  	try {
	  request = new XMLHttpRequest();
	} 
	catch (trymicrosoft) {
	  try {
	    request = new ActiveXObject("Microsoft.XMLHTTP");
	  } 
	  catch (othermicrosoft) {
	    try {
	      
	      request = new ActiveXObject("Msxml2.XMLHTTP");
	    } catch (failed) {
	      request = false;
	    }
	  }
	 }

      return request;

  }
  
  function changeFocus( )
  {
	/*判断按下回车键的控件类型：不能是提交、重置按钮等类型*/      
	if (event.keyCode==13){		  	
		  	event.keyCode=9;
		 }		    
  }
  
  
  
  function myTimer()
  {  	
  	setInterval(autoSubmit, 1000);
  }
  function autoSubmit(){
  	//debugger;
  	autoAjaxObject = create();
  	autoAjaxObject.onreadystatechange = autoRecieve;
  	autoAjaxObject.open("post","/WebChat/servlet/ChatRoomServlet",true);
  	no++;
  	autoAjaxObject.send("no="+no);
  }
  
  function autoRecieve(){
  	try
  	{
		if(autoAjaxObject.readyState == 4){
			//alert(autoAjaxObject.readyState);
			//alert("enter:" +autoAjaxObject.responseText);
			//$("contentDiv").innerHTML = autoAjaxObject.responseText;
			$("txt_ChatContent").value = autoAjaxObject.responseText;
			autoAjaxObject = false;
  		}
  		
  	}
  	catch(err)
  	{
  		return;
  	}
  }
  
  function userSubmit(){
  	//alert("aa");
  	//debugger;
  	myAjaxObject = create();
  	myAjaxObject.onreadystatechange = ajaxRecieve;
  	myAjaxObject.open("post","/WebChat/servlet/ChatRoomServlet?no="+no,true);
  	no++;
  	myAjaxObject.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
  	myAjaxObject.send("content="+$("content").value+"&no="+no);
  }
  
  function ajaxRecieve(){
	 try
	 {	
	  	if(myAjaxObject.readyState == 4){
			//$("contentDiv").innerHTML = myAjaxObject.responseText;
			$("txt_ChatContent").value = autoAjaxObject.responseText;
			myAjaxObject = false;
	  	}
	
	 }
  	catch(err)
  	{
  		return;
  	}
  }
  
  function $(itemId){
  	return document.getElementById(itemId);
  }
  </script>
  <body onload="myTimer()">
  <form action="" method="post">
  	<table>
  		<tr>
  			<td colspan="3">
  			<textarea id="txt_ChatContent" rows="5" cols="30"></textarea>
  			</td>
  		</tr>
  		<tr>
  			<td><a href=""><%
  			
  			String uname = (String)session.getAttribute("name"); 
  			if(uname == null){
  				uname = "游客";
  			}
  			out.print(uname);
  			%></a>：</td>
  			<td><input type="text" name="content" id="content"/></td>
  			<td><input type="button" name="submit" value="发言" onclick="userSubmit()" /></td>  			
  		</tr>
  	</table>
  	
  	
  </form>
  <div id="contentDiv">
  </div>
  
  
  </body>
</html>
