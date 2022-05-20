<%@ page language="java" contentType="text/html; charset=GB2312"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
 
<head>
    <meta charset="UTF-8">
    <title>login</title>
    <style>
        * {
            margin: 0;
            padding: 0;
        }
         
        html {
            height: 100%;
            width: 100%;
            overflow: hidden;
            margin: 0;
            padding: 0;
            background: url(background.png) no-repeat 0px 0px;
            background-repeat: no-repeat;
            background-size: 100% 100%;
            -moz-background-size: 100% 100%;
        }
         
        body {
            background-color:#e3edcd;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100%;
        }
         
        #loginDiv {
            width: 400px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 400px;
            background-color: rgba(75, 81, 95, 0.3);
            box-shadow: 7px 7px 17px rgba(52, 56, 66, 0.5);
            border-radius: 250px;
        }
         
        
        p {
            margin-top: 30px;
            margin-left: 20px;
            color: azure;
        }
         
        input {
            margin-left: 15px;
            border-radius: 5px;
            border-style: hidden;
            height: 30px;
            width: 140px;
            background-color: rgba(216, 191, 216, 0.5);
            outline: none;
            color: #f0edf3;
            padding-left: 10px;
        }
         
        button {
            border-color: cornsilk;
            background-color: rgba(100, 149, 237, .7);
            color: aliceblue;
            border-style: hidden;
            border-radius: 5px;
            width: 100px;
            height: 31px;
            font-size: 16px;
        }
    </style>
    <style type="text/css">
        input::-ms-input-placeholder{text-align: center;}
        input::-webkit-input-placeholder{text-align: center;}
    </style>
</head>
  
 <body>
     <%
                    if(session.getAttribute("error")=="true"){
                        out.print("<script>window.alert(\"输入用户名密码错误\")</script>");
                        session.setAttribute("error", "null");
                    }
                    %>
    <div id="loginDiv">
        <form action="CtrlServlet" id="form" method="post">
            
            <h1 style="text-align: center;color: aliceblue;">立即登录</h1>
            <p>用户名:<input type="text" name="Username" class="form-control" id="user" placeholder="请输入用户名"></p>
            
            <p>密码:<input id="password" name="Password" type="password" placeholder="请输入密码"></p>
            <div style="text-align: center;margin-top: 30px;">
                <input type="hidden" name="Ctrl" value="Login">
                <button>登录</button> 
            </div>
        </form>
    </div>
</body>
</html>