/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Book.BookinfoFacadeLocal;
import java.util.List;
import java.util.LinkedList;
import Book.Bookinfo;
import java.io.IOException;
import Cart.CartLocal;
import Cart.Cart;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author X
 */
public class CartServlet extends HttpServlet {
    @EJB
    private BookinfoFacadeLocal bookinfoFacade;
    @EJB
    private CartLocal cart;
    protected void doGet(  HttpServletRequest request, 
        HttpServletResponse response) throws ServletException, IOException {
        List<Bookinfo> b = new LinkedList<>();
        List<Integer> num = new LinkedList<>();  
        String Username = request.getSession().getAttribute("Username").toString();
        Cart c = cart.ShowCart(Username);
        if(request.getParameter("num")!= null){
            int CartNum = Integer.parseInt(request.getParameter("num"));
            int ISBN = Integer.parseInt(request.getParameter("ISBN"));
            cart.AddCart(Username, ISBN, CartNum);
        }
        if(request.getParameter("delete")!=null){
            int ISBN = Integer.parseInt(request.getParameter("ISBN"));
            cart.DeleteCart(Username, ISBN);
            request.getSession().setAttribute("delete", 0);
        }
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
        request.getRequestDispatcher("/Home.jsp").forward(request, response);
    }
    protected void doPost(  HttpServletRequest request, 
        HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
