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
            width: 70px;/*���ð�ť���*/
            height: 24px;/*���ð�ť?��*/
            color:black;/*������?*/
            background-color:#ffff33;/*��ť������?*/
            border-radius: 3px;/*�ð�ť���Բ��?��*/
            border-width: 0.5;/*��ȥ��ť��ı߿�*/
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
<header style="width: 1024px; height: 70px; background:#f0edf3">
    <table>
    <tr>&nbsp;</tr>
    <tr>
    <ul align="center">
            <%
            if(request.getSession().getAttribute("Username")!=null){
                out.print("<a style=\"font-size:30px\">��ӭ�û�&nbsp;<span style=\"color: red \">"+request.getSession().getAttribute("Username")+ "</span></a>");
                session.setAttribute("Username", request.getSession().getAttribute("Username"));
            }
            else     out.print("<a style=\"font-size:30px\"><span style=\"color: red \">���ȵ�¼&nbsp;</span></a>");
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
        &nbsp;&nbsp;<button style="margin-top:10px;">��������</button>&nbsp;&nbsp;
        </form>

        <form action="${pageContext.request.contextPath }/Login.jsp" enctype="multipart/form-data" target="frameName"align="left">
        <input type="hidden" name="Username" value=<%=request.getSession().getAttribute("Username")%>>
        &nbsp;&nbsp;<button style="margin-top:10px;">�ҵ��˻�</button>&nbsp;&nbsp;
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

<!--div_search-->
<div style="width: 1000px; margin: 0 auto; height:25px; background: #CC7;">
    <form name="form_search" align="right" method="post" action="CtrlServlet">
        <span style="font-size: small; color: #666; ">Search</span>
        <input type="text" name="Bookname">
        <input type="hidden" name="Ctrl" value="Search">
        <button>�ύ</button>
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
            if(request.getSession().getAttribute("message")=="ͼ�鲻����"){
                out.println("<script>window.alert(\"ͼ�鲻����\");</script>");  
                out.println("<form class=\"form_search\" align=\"center\" method=\"post\" action=\"CtrlServlet\">");
                out.println("<span style=\"font-size: 80px;color: #666;position: absolute;margin-top: 80px;margin-left:28px\">");
                out.println("<strong>&nbsp;&nbsp;&nbsp;Search</strong></span>");
                out.println("<input type=\"text\" name=\"Bookname\" placeholder=\"������������������\">");
                out.println("<input type=\"hidden\" name=\"Ctrl\" value=\"Search\">");
                out.println("<button style=\"font-size: medium\">����</button>");
                out.println("</form>");
            }
            else if(request.getSession().getAttribute("message")=="�����ҵ�ͼ����ϢΪ��"){
                int num = 0;
                List<Bookinfo> b = (List)request.getSession().getAttribute("bookinfo");
                if(request.getParameter("num")!=null) num = Integer.parseInt(request.getParameter("num"));
                out.println(request.getSession().getAttribute("message"));   
                if(num-7>=0){
                    request.getSession().setAttribute("message", "�����ҵ�ͼ����ϢΪ��");
                    request.getSession().setAttribute("bookinfo", b);
                    out.print("<form method = \"post\" action = \"/BookStore-war/Search.jsp\">");
                    out.print("<input type=\"hidden\" name=\"num\" value= " + (num-7) + ">");
                    out.print("<button>��һҳ</button>");
                    out.print("</form>");
                }
                else {
                    request.removeAttribute("num");
                }
                if(num+7<b.size()){
                    request.getSession().setAttribute("message", "�����ҵ�ͼ����ϢΪ��");
                    request.getSession().setAttribute("bookinfo", b);
                    out.print("<form method = \"post\" action = \"/BookStore-war/Search.jsp\">");
                    out.print("<input type=\"hidden\" name=\"num\" value= " + (num+7) + ">");
                    out.print("<button>��һҳ</button>");
                    out.print("</form>");
                }
                else {
                    request.removeAttribute("num");
                }
                out.print("<table BORDER=3>");
                out.println("<CAPTION>���ҽ��</CAPTION>");
                out.println("<TR><TH>&nbsp;���&nbsp;</TH><TH>&nbsp;����&nbsp;</TH><TH>&nbsp;����&nbsp;</TH><TH>&nbsp;�۸�&nbsp;</TH><TH>&nbsp;������&nbsp;</TH></TR>");
                for(int i=num;(i>num-7)&&(num<b.size());num++){
                    out.print("<TR><TD>");
                    out.print(b.get(num).getIsbn());
                    out.print("</TD><TD>");
                    out.print(b.get(num).getTitle());   
                    out.print("</TD><TD>");
                    out.print(b.get(num).getAuthor());   
                    out.print("</TD><TD>");
                    out.print(b.get(num).getPrice()+ "Ԫ");  
                    out.print("</TD><TD>");
                    out.print(b.get(num).getPress());
                    out.print("</TD><TD>");
                    out.print("<a href=\"" + b.get(num).getHref() + "\">����</a>");
                    out.print("</TD><TD>");
                    out.print("<form name=\"Cart\" method=\"post\" action=\"CtrlServlet\">");
                    out.print("������<input type=\"text\" name=\"num\">");
                    out.print("<input type=\"hidden\" name=\"ISBN\" value=" + b.get(num).getIsbn() + ">");
                    out.print("<input type=\"hidden\" name=\"Ctrl\" value=\"Cart\">");
                    out.print("<button>���빺�ﳵ</button>");
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

