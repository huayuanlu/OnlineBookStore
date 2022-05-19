<%@ page import= "Book.Bookinfo" import = "Order.Orderlist"  import = "java.util.List"%>
<%@ page language="java" import="java.util.*" contentType="text/html;charset=GB2312"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=GB2312">
	<title>花园路的网上书店</title>

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
            height: 26px;
            width: 120px;
            background-color: #33ffff;
            outline: none;
            color: #f0edf3;
            padding-left: 10px;
        }
         
        button{
            width: 70px;/*设置按钮宽度*/
            height: 24px;/*设置按钮?度*/
            color:black;/*字体颜?*/
            background-color:#ffff33;/*按钮背景颜?*/
            border-radius: 3px;/*让按钮变得圆滑?点*/
            border-width: 0.5;/*消去按钮丑的边框*/
            margin: 0;
            outline: none;/*取消轮廓*/
            font-family: KaiTi;/*字体设置为楷体*/
            font-size: 6px;/*设置字体??*/
            text-align: center;/*字体居中*/
            cursor: pointer;/*设置?标箭头?势*/
        }
    </style>
    <style type="text/css">
        input::-ms-input-placeholder{text-align: center;}
        input::-webkit-input-placeholder{text-align: center;}
    </style>
</head>
<body>
<div style="width: 1024px;	margin: 0 auto;	background: #eee;">

<!--header_begin-->
<header style="width: 1024px; height: 70px;">
    <table>
    <tr>&nbsp;</tr>
    <tr>
    <ul align="center">
            <%
            if(request.getSession().getAttribute("Username")!=null){
                out.print("<a>欢迎用户&nbsp;<span style=\"color: red \">"+request.getSession().getAttribute("Username")+ "</span></a>");
                session.setAttribute("Username", request.getSession().getAttribute("Username"));
            }
            else     out.print("<a><span style=\"color: red \">请先登录&nbsp;</span></a>");
            if(request.getSession().getAttribute("ClearAll")== "1"){
                session.removeAttribute("message");
                session.removeAttribute("bookinfo");
                session.removeAttribute("cartmessage");
                session.removeAttribute("cartinfo");
                session.removeAttribute("Cost");
                session.removeAttribute("Orderlist");
                session.setAttribute("ClearAll", "0");
            }
            %>

    </ul>
        <form action="${pageContext.request.contextPath }/CtrlServlet" enctype="multipart/form-data" target="frameName" method="post" align="left">
        <input type="hidden" name="Username" value=<%=request.getSession().getAttribute("Username")%>>
        &nbsp;&nbsp;<button>购物中心</button>&nbsp;&nbsp;
        </form>
<!--        <span>&nbsp|&nbsp;</span>-->
        <form action="${pageContext.request.contextPath }/Login.jsp" enctype="multipart/form-data" target="frameName"align="left">
        <input type="hidden" name="Username" value=<%=request.getSession().getAttribute("Username")%>>
        &nbsp;&nbsp;<button>我的账户</button>&nbsp;&nbsp;
        </form>
    </tr>
    <tr>&nbsp;</tr>
    </table>   
</header>
<!--header_end-->

<!--nav_begin-->
<nav style="width: 1000px; margin: 0 auto; height:25px;	background: #000;">	
<ul align="center">
    <a href="#"><span style="color: white; font-size: x-small; ">文学&nbsp;</span></a>
    <a href="#"><span style="color: white; font-size: x-small; ">生活&nbsp;</span></a>
    <a href="#"><span style="color: white; font-size: x-small; ">计算机&nbsp;</span></a>
    <a href="#"><span style="color: white; font-size: x-small; ">外语&nbsp;</span></a>
    <a href="#"><span style="color: white; font-size: x-small; ">经营&nbsp;</span></a>
    <a href="#"><span style="color: white; font-size: x-small; ">荔枝&nbsp;</span></a>
    <a href="#"><span style="color: white; font-size: x-small; ">社科&nbsp;</span></a>
    <a href="#"><span style="color: white; font-size: x-small; ">学术&nbsp;</span></a>
    <a href="#"><span style="color: white; font-size: x-small; ">少儿&nbsp;</span></a>
    <a href="#"><span style="color: white; font-size: x-small; ">艺术&nbsp;</span></a>
    <a href="#"><span style="color: white; font-size: x-small; ">原版&nbsp;</span></a>
    <a href="#"><span style="color: white; font-size: x-small; ">科技&nbsp;</span></a>
    <a href="#"><span style="color: white; font-size: x-small; ">考试&nbsp;</span></a>
    <a href="#"><span style="color: white; font-size: x-small; ">生活百科&nbsp;</span></a>
    <a href="#"><span style="color: yellow; font-size: x-small; ">全部商品目录</span></a>
</ul>
</nav>
<!--nav_end-->

<!--div_search-->
<div style="width: 1000px; margin: 0 auto; height:25px; background: #CC7;">
    <form name="form_search" align="right" method="post" action="CtrlServlet">
        <span style="font-size: small; color: #666; ">Search</span>
        <input type="text" name="Bookname">
        <input type="hidden" name="Ctrl" value="Search">
        <button>提交</button>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </form>
</div>
<!--div_search-->

<hr/> 

<!--div_PRODUCT_LIST-->
<div style="width: 1000px; margin: 0 auto; height:75px; background: #CC7;border-radius:15px;">
    <table>
    <tr>&nbsp;</tr>
    <tr>
    <p>
        <span text="center" style="font-size: medium; color: #fff; ">
        <strong>&nbsp;&nbsp;&nbsp;PRODUCT LIST</strong>
        </span>
    </p>
    </tr>
    <tr>&nbsp;</tr>
    </table>
</div>
<!--div_PRODUCT_LIST-->

<!--footer_begin-->
<footer style="width:1024px; margin: 0 auto; height:60px;  background: #CCA;">
    <table>
    <tr>
    <td width="341">
    <img src="images/logo.png" align="left">
    </td>
    <td>
    <p>CONTACT US</p>
    <p align="center">copyright 2008 &copy; BookStore All Rights RESSERVED</p>
    </td>

    </tr>
    </table>
</footer>
<!--footer_end-->
</div>
</body>
</html>

