<%@ page import= "Book.Bookinfo" import = "Order.Orderlist"  import = "java.util.List"%>
<%@ page language="java" import="java.util.*" contentType="text/html;charset=GB2312"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=GB2312">
	<title>花园路的网上书店</title>

<style type="text/css">
	/*重置浏览器的默认样式 */
* { margin:0; padding:0;  list-style:none;}
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
        <form action="${pageContext.request.contextPath }/CartServlet" enctype="multipart/form-data" target="frameName" method="post" align="left">
        <input type="hidden" name="Username" value=<%=request.getSession().getAttribute("Username")%>>
        <button>购物中心</button>
        </form>
<!--        <span>&nbsp|&nbsp;</span>-->
        <form action="${pageContext.request.contextPath }/Login.jsp" enctype="multipart/form-data" target="frameName"align="left">
        <input type="hidden" name="Username" value=<%=request.getSession().getAttribute("Username")%>>
        <button>我的账户</button>
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
    <form name="form_search" align="right" method="post" action="SearchServlet">
        <span style="font-size: small; color: #666; ">Search</span>
        <input type="text" name="Bookname">
        <input type="submit">
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </form>
</div>
<!--div_search-->

<hr/> 

<!--div_PRODUCT_LIST-->
<div style="width: 1000px; margin: 0 auto; height:60px; background: #CC7;border-radius:15px;">
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
<div style="width: 790px; margin: 0 auto; height:550px;">
    <tr>
        <%
            if(request.getSession().getAttribute("message")=="图书不存在"){
                out.println(request.getSession().getAttribute("message"));
            }
            else if(request.getSession().getAttribute("message")=="您查找的图书信息为："){
                out.println(request.getSession().getAttribute("message"));   
                out.print("<table BORDER=5>");
                out.println("<CAPTION>查找结果</CAPTION>");
                out.println("<TR><TH>&nbsp;书号&nbsp;</TH><TH>&nbsp;书名&nbsp;</TH><TH>&nbsp;作者&nbsp;</TH><TH>&nbsp;价格&nbsp;</TH><TH>&nbsp;出版社&nbsp;</TH></TR>");
                List<Bookinfo> b = (List)request.getSession().getAttribute("bookinfo");
                for(int i=0;i<b.size();i++){
                    out.print("<TR><TD>");
                    out.print(b.get(i).getIsbn());
                    out.print("</TD><TD>");
                    out.print(b.get(i).getTitle());   
                    out.print("</TD><TD>");
                    out.print(b.get(i).getAuthor());   
                    out.print("</TD><TD>");
                    out.print(b.get(i).getPrice());  
                    out.print("</TD><TD>");
                    out.print(b.get(i).getPress());
                    out.print("</TD><TD>");
                    out.print("<form name=\"Cart\" method=\"post\" action=\"CartServlet\">");
                    out.print("数量：<input type=\"text\" name=\"num\">");
                    out.print("<input type=\"hidden\" name=\"ISBN\" value=" + b.get(i).getIsbn() + ">");
                    out.print("<button>加入购物车</button>");
                    out.print("</form>");
                    out.print("<TD></TR>");
                }
            }
            %>
    </table>        
            
    </tr>
        <%
            if(request.getSession().getAttribute("cartmessage")=="您的购物车为空"){
                out.println(request.getSession().getAttribute("cartmessage"));   
            }
            else if(request.getSession().getAttribute("cartmessage")=="购物车："){
                out.println(request.getSession().getAttribute("cartmessage"));   
                out.print("<table BORDER=6>");
                out.println("<CAPTION>购物车</CAPTION>");
                out.println("<TR><TH>&nbsp;书号&nbsp;</TH><TH>&nbsp;书名&nbsp;</TH><TH>&nbsp;作者&nbsp;</TH><TH>&nbsp;价格&nbsp;</TH><TH>&nbsp;出版社&nbsp;</TH><TH>&nbsp;数量&nbsp;</TH></TR>");
                List<Bookinfo> b = (List)request.getSession().getAttribute("cartinfo");
                List<Integer> num = (List)request.getSession().getAttribute("num");
                for(int i=0;i<b.size();i++){
                    out.print("<TR><TD>");
                    out.print(b.get(i).getIsbn());
                    out.print("</TD><TD>");
                    out.print(b.get(i).getTitle());   
                    out.print("</TD><TD>");
                    out.print(b.get(i).getAuthor());   
                    out.print("</TD><TD>");
                    out.print(b.get(i).getPrice());  
                    out.print("</TD><TD>");
                    out.print(b.get(i).getPress());
                    out.print("</TD><TD>");
                    out.print(num.get(i));  
                    out.print("</TD><TD>");
                    out.print("<form method=\"post\" action=\"CartServlet\">");
                    out.print("<input type=\"hidden\" name=\"ISBN\" value=" + b.get(i).getIsbn() + ">");
                    out.print("<input type=\"hidden\" name=\"delete\" value=1>");
                    out.print("<button>移除</button>");
                    out.print("</form>");
                    out.print("<TD></TR>");
                }
                out.print("<form name=\"Cart\" method=\"post\" action=\"OrderServlet\">");
                out.print("<input type=\"hidden\" name=\"Username\" value=" + request.getSession().getAttribute("Username") + ">");
                out.print("<button>结算</button>");
                out.print("</form>");
            }
            %>
    </table>  
    <%
            if(request.getSession().getAttribute("Cost")!= null){
                out.println("<a> 共花费" + request.getSession().getAttribute("Cost") + "元</a>");
            }
            List<Orderlist> o = (List)request.getSession().getAttribute("Orderlist");
            if(o!=null){
                out.print("<table BORDER=7>");
                out.println("<CAPTION>订单记录</CAPTION>");
                out.println("<TR><TH>&nbsp;订单编号&nbsp;</TH><TH>&nbsp;书号&nbsp;"
                        + "</TH><TH>&nbsp;书名&nbsp;</TH><TH>&nbsp;用户&nbsp;"
                        + "</TH><TH>&nbsp;数量&nbsp;</TH><TH>&nbsp;价格&nbsp;"
                        + "</TH><TH>&nbsp;时间&nbsp;</TH></TR>");
                for(int i=0;i<o.size();i++){
                    Orderlist tmp = o.get(i);
                    out.print("<TR><TD>");
                    out.print(tmp.getOrderid());
                    out.print("</TD><TD>");
                    out.print(tmp.getIsbn());   
                    out.print("</TD><TD>");
                    out.print(tmp.getTitle());   
                    out.print("</TD><TD>");
                    out.print(tmp.getUsername());  
                    out.print("</TD><TD>");
                    out.print(tmp.getCartnum());
                    out.print("</TD><TD>");
                    out.print(tmp.getCost());  
                    out.print("</TD><TD>");
                    out.print(tmp.getTime());  
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

