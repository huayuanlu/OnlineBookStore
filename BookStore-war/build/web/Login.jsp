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
    <style>
         
        .form-group{
            margin-left: 15px;
            border-radius: 5px;
            border-style: hidden;
            height: 30px;
            width: 140px;
            background-color: DodgerBlue;;
            outline: none;
            color: #f0edf3;
            padding-left: 10px;
        }
         .button{
            width: 70px;/*设置按钮宽度*/
            height: 20px;/*设置按钮?度*/
            color:white;/*字体颜?*/
            background-color:#99ffff;/*按钮背景颜?*/
            border-radius: 3px;/*让按钮变得圆滑?点*/
            border-width: 0;/*消去按钮丑的边框*/
            margin: 0;
            outline: none;/*取消轮廓*/
            font-family: KaiTi;/*字体设置为楷体*/
            font-size: 6px;/*设置字体??*/
            text-align: center;/*字体居中*/
            cursor: pointer;/*设置?标箭头?势*/
        }
        .Container{
            width:500px;height:500px;box-shadow:0 0 5px #000;position:relative;
        }
        .Login{
            width:120px;height:100px;background:#99ff99;

            position:absolute;left:0;right:0;top:0;bottom:0;margin:auto;
        }
    </style>
  </head>
  <body>
  	<div class="Container" style="width: 400px;">
  		<h3 style="text-align: center;">登录</h3>
                <%
                    if(session.getAttribute("error")=="true"){
                        out.print("<script>window.alert(\"输入用户名密码错误\")</script>");
                        session.setAttribute("error", "null");
                    }
                    %>
        <form class="Login" action="${pageContext.request.contextPath }/CtrlServlet" method="post">
	      <div class="form-group">
	        <label for="user">用户名：</label>
	        <input type="text" name="Username" class="form-control" id="user" placeholder="请输入用户名"/>
	      </div>
	      <div class="form-group">
	        <label for="password">密码：</label>
                <input type="text" name="Password" class="form-control" id="user" placeholder="请输入密码"/>
	      </div>
	      <hr/>
	      <div>
                <input type="hidden" name="Ctrl" value="Login">
                <input class="button" type="submit" value="登录">
	       </div>
	  </form>
  	</div>
  </body>
</html>
