<%@ page import= "Book.Bookinfo" import = "Order.Orderlist"  import = "java.util.List"%>
<%@ page language="java" import="java.util.*" contentType="text/html;charset=GB2312"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=GB2312">
	<title>��԰·���������</title>

<style type="text/css">
	/*�����������Ĭ����ʽ */
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
                out.print("<a>��ӭ�û�&nbsp;<span style=\"color: red \">"+request.getSession().getAttribute("Username")+ "</span></a>");
                session.setAttribute("Username", request.getSession().getAttribute("Username"));
            }
            else     out.print("<a><span style=\"color: red \">���ȵ�¼&nbsp;</span></a>");
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
        <button>��������</button>
        </form>
<!--        <span>&nbsp|&nbsp;</span>-->
        <form action="${pageContext.request.contextPath }/Login.jsp" enctype="multipart/form-data" target="frameName"align="left">
        <input type="hidden" name="Username" value=<%=request.getSession().getAttribute("Username")%>>
        <button>�ҵ��˻�</button>
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
            if(request.getSession().getAttribute("message")=="ͼ�鲻����"){
                out.println(request.getSession().getAttribute("message"));
            }
            else if(request.getSession().getAttribute("message")=="�����ҵ�ͼ����ϢΪ��"){
                out.println(request.getSession().getAttribute("message"));   
                out.print("<table BORDER=5>");
                out.println("<CAPTION>���ҽ��</CAPTION>");
                out.println("<TR><TH>&nbsp;���&nbsp;</TH><TH>&nbsp;����&nbsp;</TH><TH>&nbsp;����&nbsp;</TH><TH>&nbsp;�۸�&nbsp;</TH><TH>&nbsp;������&nbsp;</TH></TR>");
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
                    out.print("������<input type=\"text\" name=\"num\">");
                    out.print("<input type=\"hidden\" name=\"ISBN\" value=" + b.get(i).getIsbn() + ">");
                    out.print("<button>���빺�ﳵ</button>");
                    out.print("</form>");
                    out.print("<TD></TR>");
                }
            }
            %>
    </table>        
            
    </tr>
        <%
            if(request.getSession().getAttribute("cartmessage")=="���Ĺ��ﳵΪ��"){
                out.println(request.getSession().getAttribute("cartmessage"));   
            }
            else if(request.getSession().getAttribute("cartmessage")=="���ﳵ��"){
                out.println(request.getSession().getAttribute("cartmessage"));   
                out.print("<table BORDER=6>");
                out.println("<CAPTION>���ﳵ</CAPTION>");
                out.println("<TR><TH>&nbsp;���&nbsp;</TH><TH>&nbsp;����&nbsp;</TH><TH>&nbsp;����&nbsp;</TH><TH>&nbsp;�۸�&nbsp;</TH><TH>&nbsp;������&nbsp;</TH><TH>&nbsp;����&nbsp;</TH></TR>");
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
                    out.print("<button>�Ƴ�</button>");
                    out.print("</form>");
                    out.print("<TD></TR>");
                }
                out.print("<form name=\"Cart\" method=\"post\" action=\"OrderServlet\">");
                out.print("<input type=\"hidden\" name=\"Username\" value=" + request.getSession().getAttribute("Username") + ">");
                out.print("<button>����</button>");
                out.print("</form>");
            }
            %>
    </table>  
    <%
            if(request.getSession().getAttribute("Cost")!= null){
                out.println("<a> ������" + request.getSession().getAttribute("Cost") + "Ԫ</a>");
            }
            List<Orderlist> o = (List)request.getSession().getAttribute("Orderlist");
            if(o!=null){
                out.print("<table BORDER=7>");
                out.println("<CAPTION>������¼</CAPTION>");
                out.println("<TR><TH>&nbsp;�������&nbsp;</TH><TH>&nbsp;���&nbsp;"
                        + "</TH><TH>&nbsp;����&nbsp;</TH><TH>&nbsp;�û�&nbsp;"
                        + "</TH><TH>&nbsp;����&nbsp;</TH><TH>&nbsp;�۸�&nbsp;"
                        + "</TH><TH>&nbsp;ʱ��&nbsp;</TH></TR>");
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

