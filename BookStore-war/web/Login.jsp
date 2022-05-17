<%-- 
    Document   : Login
    Created on : 2022-5-6, 17:18:38
    Author     : X
--%>

<%@ page language="java" contentType="text/html; charset=GB2312"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=GB2312">
    <title>登录</title>
  </head>
  <body>
  	<div class="container" style="width: 400px;">
  		<h3 style="text-align: center;">登录</h3>
        <form action="${pageContext.request.contextPath }/LoginServlet" method="post">
	      <div class="form-group">
	        <label for="user">用户名：</label>
	        <input type="text" name="Username" class="form-control" id="user" placeholder="请输入用户名"/>
	      </div>
	      
	      <div class="form-group">
	        <label for="password">密码：</label>
	        <input type="password" name="Password" class="form-control" id="password" placeholder="请输入密码"/>
	      </div>
	     
	       <div style="color: red;">${log_msg}</div>
	      <hr/>
	      <div class="form-group" style="text-align: center;">
	        <input class="btn btn btn-primary" type="submit" value="登录/注册">
	       </div>
                <td> <div style="color:red; align:center;">${note }</div> </td> 
	  	</form>
  	</div>
  </body>
</html>
