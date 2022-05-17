import Book.BookinfoFacadeLocal;
import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class SearchServlet extends HttpServlet 
{
    @EJB
    private BookinfoFacadeLocal bookinfoFacade;
    protected void doGet(  HttpServletRequest request, 
        HttpServletResponse response) throws ServletException, IOException {
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
        request.getRequestDispatcher("/Home.jsp").forward(request, response);
    }
    protected void doPost(  HttpServletRequest request, 
        HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
