<%@ page import= "Book.Bookinfo" import = "Order.Orderlist"  import = "java.util.List"%>
<%@ page language="java" import="java.util.*" contentType="text/html;charset=GB2312"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=GB2312">
	<title>��԰·���������</title>

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
            margin-top: 15px;
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
            width: 70px;/*���ð�ť���*/
            height: 24px;/*���ð�ť?��*/
            color:black;/*������?*/
            background-color:#ffff33;/*��ť������?*/
            border-radius: 3px;/*�ð�ť���Բ��?��*/
            border-width: 0.5;/*��ȥ��ť��ı߿�*/
            margin: 0;
            outline: none;/*ȡ������*/
            font-family: KaiTi;/*��������Ϊ����*/
            font-size: 6px;/*��������??*/
            text-align: center;/*�������*/
            cursor: pointer;/*����?���ͷ?��*/
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
            width: 90px;/*���ð�ť���*/
            height: 50px;/*���ð�ť?��*/
            color:black;
            border-radius: 15px;/*�ð�ť���Բ��?��*/
            border-width: 0.5;/*��ȥ��ť��ı߿�*/
            margin-top: 240px;
            margin-left: -70px; 
            outline: #191665;
            font-family: KaiTi;/*��������Ϊ����*/
            font-size: 15px;/*��������??*/
            text-align: center;/*�������*/
            cursor: pointer;/*����?���ͷ?��*/
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
<header style="width: 1024px; height: 70px;">
    <table>
    <tr>&nbsp;</tr>
    <tr>
    <ul align="center">
            <%
            if(request.getSession().getAttribute("Username")!=null){
                out.print("<a>��ӭ�û�&nbsp;<span style=\"color: red \">"+request.getSession().getAttribute("Username")+ "</span></a>");
                session.setAttribute("Username", request.getSession().getAttribute("Username"));
            }
            else     {
                out.print("<a><span style=\"color: red \">���ȵ�¼&nbsp;</span></a>");
            }
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
        &nbsp;&nbsp;<button>��������</button>&nbsp;&nbsp;
        </form>
<!--        <span>&nbsp|&nbsp;</span>-->
        <form action="/BookStore-war/Login.jsp" enctype="multipart/form-data" target="frameName"align="left">
        <input type="hidden" name="Username" value=<%=request.getSession().getAttribute("Username")%>>
        &nbsp;&nbsp;<button>�ҵ��˻�</button>&nbsp;&nbsp;
        </form>
    </tr>
    <tr>&nbsp;</tr>
    </table>   
</header>
<!--header_end-->

<!--nav_begin-->
<nav style="width: 1000px; margin: 0 auto; height:25px;	background: #000;">	
<ul align="center">
    <a href="#"><span style="color: white; font-size: x-small; ">��ѧ&nbsp;</span></a>
    <a href="#"><span style="color: white; font-size: x-small; ">����&nbsp;</span></a>
    <a href="#"><span style="color: white; font-size: x-small; ">�����&nbsp;</span></a>
    <a href="#"><span style="color: white; font-size: x-small; ">����&nbsp;</span></a>
    <a href="#"><span style="color: white; font-size: x-small; ">��Ӫ&nbsp;</span></a>
    <a href="#"><span style="color: white; font-size: x-small; ">��֦&nbsp;</span></a>
    <a href="#"><span style="color: white; font-size: x-small; ">���&nbsp;</span></a>
    <a href="#"><span style="color: white; font-size: x-small; ">ѧ��&nbsp;</span></a>
    <a href="#"><span style="color: white; font-size: x-small; ">�ٶ�&nbsp;</span></a>
    <a href="#"><span style="color: white; font-size: x-small; ">����&nbsp;</span></a>
    <a href="#"><span style="color: white; font-size: x-small; ">ԭ��&nbsp;</span></a>
    <a href="#"><span style="color: white; font-size: x-small; ">�Ƽ�&nbsp;</span></a>
    <a href="#"><span style="color: white; font-size: x-small; ">����&nbsp;</span></a>
    <a href="#"><span style="color: white; font-size: x-small; ">����ٿ�&nbsp;</span></a>
    <a href="#"><span style="color: yellow; font-size: x-small; ">ȫ����ƷĿ¼</span></a>
</ul>
</nav>
<!--nav_end-->

<hr/> 

<!--div_PRODUCT_LIST-->
<div style="width: 1000px; margin: 0 auto; height:75px; background: #CC7;border-radius:15px;">
    <table>
    <tr>&nbsp;</tr>
    <tr>
    <p>
        <span text="center" style="font-size: larger; color: #fff; ">
            <strong>&nbsp;&nbsp;&nbsp;PRODUCT LIST</strong>
        </span>
    </p>
    </tr>
    <tr>&nbsp;</tr>
    </table>
</div>
<!--div_PRODUCT_LIST-->
<div style="width: 790px; margin: 0 auto; height:550px;"> 
   
    <form class="form_search" align="center" method="post" action="CtrlServlet">
        <span style="font-size: 80px;color: #666;position: absolute;margin-top: 80px;margin-left:28px">
            <strong>&nbsp;&nbsp;&nbsp;Search</strong>
        </span>
        <input type="text" name="Bookname" placeholder="������������������">
        <input type="hidden" name="Ctrl" value="Search">
        <button style="font-size: medium">����</button>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </form>
</div>
<!--footer_begin-->
<footer style="width:1024px; margin: 0 auto; height:60px;  background: #CCA;">
    <table>
    <tr>
    <td width="341">
    <img src="images/logo.png" align="left">
    </td>
    <td>
    <p>@��԰·���������</p>
    </td>

    </tr>
    </table>
</footer>
<!--footer_end-->
</div>
</body>
</html>

