import Book.Bookinfo;
import Book.BookinfoFacadeLocal;
import Cart.Cart;
import Cart.CartLocal;
import Order.OrderlistFacadeLocal;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author X
 */
public class OrderServlet extends HttpServlet {
    @EJB
    private OrderlistFacadeLocal orderlistFacade;
    @EJB
    private BookinfoFacadeLocal bookinfoFacade;
    @EJB
    private CartLocal cart;

    
    protected void doGet(  HttpServletRequest request, 
        HttpServletResponse response) throws ServletException, IOException {
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
        request.getRequestDispatcher("/Home.jsp").forward(request, response);
    }
    
    protected void doPost(  HttpServletRequest request, 
        HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
