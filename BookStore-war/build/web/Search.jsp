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
            background-color:#e3edcd;
            -moz-background-size: 100% 100%;
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
            color: black;
            font-family: KaiTi;
            padding-left: 10px;
        }

        button{
            width: 70px;/*设置按钮宽度*/
            height: 24px;/*设置按钮?度*/
            color:black;/*字体颜?*/
            background-color:#ffff33;/*按钮背景颜?*/
            border-radius: 3px;/*让按钮变得圆滑?点*/
            border-width: 0.5;/*消去按钮丑的边框*/
            outline: none;/*取消轮廓*/
            font-family: KaiTi;/*字体设置为楷体*/
            font-size: 6px;/*设置字体??*/
            text-align: center;/*字体居中*/
            cursor: pointer;/*设置?标箭头?势*/
        }
                
        .form_search input{
            margin-left: 0;
            margin-top: 240px;
            border-radius: 10px;
            border-style: hidden;
            height: 50px;
            width: 500px;
            padding-left: 10px;
            background-color: #a3c3bc;
            font-family: sans-serif;
            font-size: 20px;
            text-align: left;
        }
        
        .form_search button{
            text-decoration: none;
            position: absolute;
            width: 90px;/*设置按钮宽度*/
            height: 50px;/*设置按钮?度*/
            color:black;
            border-radius: 15px;/*让按钮变得圆滑?点*/
            border-width: 0.5;/*消去按钮丑的边框*/
            margin-top: 240px;
            margin-left: -70px; 
            outline: #191665;
            font-family: KaiTi;/*字体设置为楷体*/
            font-size: 15px;/*设置字体??*/
            text-align: center;/*字体居中*/
            cursor: pointer;/*设置?标箭头?势*/
            background: linear-gradient(90deg,#03a9f4,#f441a5,#ffeb3b,#03a9f3);
            background-size: 400%;
            color: #ffffff;
        }
    </style>
    <style type="text/css">
        input::-ms-input-placeholder{text-align: left;}
        input::-webkit-input-placeholder{text-align: left;}
    </style>
</head>
<body>
<div style="width: 1024px;	margin: 0 auto;	background: #eee;">

<!--header_begin-->
<header style="width: 1024px; height: 70px; background:#f0edf3">
    <table>
    <tr>&nbsp;</tr>
    <tr>
    <ul align="center">
            <%
            if(request.getSession().getAttribute("Username")!=null){
                out.print("<a style=\"font-size:30px\">欢迎用户&nbsp;<span style=\"color: red \">"+request.getSession().getAttribute("Username")+ "</span></a>");
                session.setAttribute("Username", request.getSession().getAttribute("Username"));
            }
            else     out.print("<a style=\"font-size:30px\"><span style=\"color: red \">请先登录&nbsp;</span></a>");
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
    
        <form action="CtrlServlet"method="post">
        <input type="hidden" name="Ctrl" value="Cart">
        <input type="hidden" name="Username" value=<%=request.getSession().getAttribute("Username")%>>
        &nbsp;&nbsp;<button style="margin-top:10px;">购物中心</button>&nbsp;&nbsp;
        </form>

        <form action="${pageContext.request.contextPath }/Login.jsp" enctype="multipart/form-data" target="frameName"align="left">
        <input type="hidden" name="Username" value=<%=request.getSession().getAttribute("Username")%>>
        &nbsp;&nbsp;<button style="margin-top:10px;">我的账户</button>&nbsp;&nbsp;
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
<!--showBooks-->
<div style="font-size:x-small; width: 950px; margin: 0 auto; height:550px; background:#f0edf3">
        <%
            if(request.getSession().getAttribute("message")=="图书不存在"){
                out.println("<script>window.alert(\"图书不存在\");</script>");  
                out.println("<form class=\"form_search\" align=\"center\" method=\"post\" action=\"CtrlServlet\">");
                out.println("<span style=\"font-size: 80px;color: #666;position: absolute;margin-top: 80px;margin-left:28px\">");
                out.println("<strong>&nbsp;&nbsp;&nbsp;Search</strong></span>");
                out.println("<input type=\"text\" name=\"Bookname\" placeholder=\"输入你想搜索的书名\">");
                out.println("<input type=\"hidden\" name=\"Ctrl\" value=\"Search\">");
                out.println("<button style=\"font-size: medium\">搜索</button>");
                out.println("</form>");
            }
            else if(request.getSession().getAttribute("message")=="您查找的图书信息为："){
                int num = 0;
                List<Bookinfo> b = (List)request.getSession().getAttribute("bookinfo");
                if(request.getParameter("num")!=null) num = Integer.parseInt(request.getParameter("num"));
                out.println(request.getSession().getAttribute("message"));   
                if(num-7>=0){
                    request.getSession().setAttribute("message", "您查找的图书信息为：");
                    request.getSession().setAttribute("bookinfo", b);
                    out.print("<form method = \"post\" action = \"/BookStore-war/Search.jsp\">");
                    out.print("<input type=\"hidden\" name=\"num\" value= " + (num-7) + ">");
                    out.print("<button>上一页</button>");
                    out.print("</form>");
                }
                else {
                    request.removeAttribute("num");
                }
                if(num+7<b.size()){
                    request.getSession().setAttribute("message", "您查找的图书信息为：");
                    request.getSession().setAttribute("bookinfo", b);
                    out.print("<form method = \"post\" action = \"/BookStore-war/Search.jsp\">");
                    out.print("<input type=\"hidden\" name=\"num\" value= " + (num+7) + ">");
                    out.print("<button>下一页</button>");
                    out.print("</form>");
                }
                else {
                    request.removeAttribute("num");
                }
                out.print("<table BORDER=3>");
                out.println("<CAPTION>查找结果</CAPTION>");
                out.println("<TR><TH>&nbsp;书号&nbsp;</TH><TH>&nbsp;书名&nbsp;</TH><TH>&nbsp;作者&nbsp;</TH><TH>&nbsp;价格&nbsp;</TH><TH>&nbsp;出版社&nbsp;</TH></TR>");
                for(int i=num;(i>num-7)&&(num<b.size());num++){
                    out.print("<TR><TD>");
                    out.print(b.get(num).getIsbn());
                    out.print("</TD><TD>");
                    out.print(b.get(num).getTitle());   
                    out.print("</TD><TD>");
                    out.print(b.get(num).getAuthor());   
                    out.print("</TD><TD>");
                    out.print(b.get(num).getPrice()+ "元");  
                    out.print("</TD><TD>");
                    out.print(b.get(num).getPress());
                    out.print("</TD><TD>");
                    out.print("<a href=\"" + b.get(num).getHref() + "\">详情</a>");
                    out.print("</TD><TD>");
                    out.print("<form name=\"Cart\" method=\"post\" action=\"CtrlServlet\">");
                    out.print("数量：<input type=\"text\" name=\"num\">");
                    out.print("<input type=\"hidden\" name=\"ISBN\" value=" + b.get(num).getIsbn() + ">");
                    out.print("<input type=\"hidden\" name=\"Ctrl\" value=\"Cart\">");
                    out.print("<button>加入购物车</button>");
                    out.print("</form>");
                    out.print("<TD></TR>");
                } 
            }
            %>
    </table>
</div>
<!--showBooks-->

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

