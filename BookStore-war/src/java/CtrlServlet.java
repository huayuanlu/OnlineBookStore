/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Book.Bookinfo;
import Book.BookinfoFacadeLocal;
import Cart.Cart;
import Cart.CartLocal;
import Order.OrderlistFacadeLocal;
import User.UserLocal;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author X
 */
public class CtrlServlet extends HttpServlet {
@EJB
    private UserLocal user;
@EJB
    private BookinfoFacadeLocal bookinfoFacade;
@EJB
    private CartLocal cart;
@EJB
    private OrderlistFacadeLocal orderlistFacade;
@Override
    protected void doGet(  HttpServletRequest request, 
        HttpServletResponse response) throws ServletException, IOException {
        /************************************ LoginServlet ***********************************/
        if("Login".equals(request.getParameter("Ctrl"))){
            request.setCharacterEncoding("ISO-8859-1");
            String Username = request.getParameter("Username");
            String Password = request.getParameter("Password");
            Username= new String(Username.getBytes("ISO-8859-1"),"GB2312");
            Password= new String(Password.getBytes("ISO-8859-1"),"GB2312");
            if(user.Find(Username, Password)==null){    //用户不存在
                request.getSession().setAttribute("error", "true");
                request.getRequestDispatcher("/Login.jsp").forward(request, response);
            }
            request.getSession().setAttribute("Username", Username);
            request.getSession().setAttribute("ClearAll", "1");
            request.getSession().removeAttribute("Ctrl");
            request.getRequestDispatcher("/Home.jsp").forward(request, response);
        }
        /************************************ SearchServlet ***********************************/
        else if("Search".equals(request.getParameter("Ctrl"))){
            request.setCharacterEncoding("ISO-8859-1");
            String Name = request.getParameter("Bookname");
            Name= new String(Name.getBytes("ISO-8859-1"),"GB2312");
            if(!bookinfoFacade.SearchByTitle(Name).isEmpty()){
                request.getSession().setAttribute("bookinfo", bookinfoFacade.SearchByTitle(Name));
                request.getSession().setAttribute("message", "您查找的图书信息为：");
            }
            else {
                request.getSession().setAttribute("message", "图书不存在");
            }
            request.getSession().removeAttribute("Ctrl");
            request.getRequestDispatcher("/Search.jsp").forward(request, response);
        }
        /************************************ CartServlet ***********************************/
        else if("Cart".equals(request.getParameter("Ctrl"))){
            List<Bookinfo> b = new LinkedList<>();
            List<Integer> num = new LinkedList<>();  
            String Username = request.getSession().getAttribute("Username").toString();
            if(request.getParameter("num")!= null){
                int CartNum = Integer.parseInt(request.getParameter("num"));
                int ISBN = Integer.parseInt(request.getParameter("ISBN"));
                cart.AddCart(Username, ISBN, CartNum);
            }
            if(request.getParameter("delete")!=null){
                int ISBN = Integer.parseInt(request.getParameter("ISBN"));
                cart.DeleteCart(Username, ISBN);
                request.getSession().setAttribute("delete", "null");
            }
            Cart c = cart.ShowCart(Username);
            if(!c.getISBN().isEmpty() ){
                for(int i=0;i<c.getISBN().size();i++){
                    num.add(c.getNum().get(i));
                    b.add((Bookinfo)bookinfoFacade.findByISBN(c.getISBN().get(i)));
                }
                if(!b.isEmpty()) request.getSession().setAttribute("cartmessage", "购物车：");
                else request.getSession().setAttribute("cartmessage", "您的购物车为空");
            }
            else request.getSession().setAttribute("cartmessage", "您的购物车为空");
            request.getSession().setAttribute("cartinfo", b);   
            request.getSession().setAttribute("num", num);
            request.getSession().removeAttribute("Ctrl");
            request.getRequestDispatcher("/Cart.jsp").forward(request, response);
        }
        /************************************ OrderServlet ***********************************/
        else if("Order".equals(request.getParameter("Ctrl"))){
            String Username = request.getSession().getAttribute("Username").toString();
            Cart c = cart.ShowCart(Username);
            double sum = 0;
            if(!c.getISBN().isEmpty()){
                for(int i=0;i<c.getISBN().size();i++){
                    Bookinfo b = (Bookinfo)bookinfoFacade.findByISBN(c.getISBN().get(i));
                    Date day=new Date();
                    SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    orderlistFacade.Insert(orderlistFacade.GetMaxOrderID(), b.getIsbn(), b.getTitle() , c.getNum().get(i), Username, b.getPrice() * c.getNum().get(i),sdf.format(day));
                    sum += b.getPrice() * c.getNum().get(i);
                }
                request.getSession().setAttribute("Cost", sum);
                cart.DeleteAll(Username);
            }
            request.getSession().setAttribute("Orderlist", orderlistFacade.FindByUsername(Username));
            request.getSession().removeAttribute("Ctrl");
            request.getRequestDispatcher("/Order.jsp").forward(request, response);
        }
    }
@Override
    protected void doPost(  HttpServletRequest request, 
        HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
