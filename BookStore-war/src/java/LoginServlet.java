import User.UserLocal;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class LoginServlet extends HttpServlet 
{
    @EJB
    private UserLocal user;
    protected void doGet(  HttpServletRequest request, 
        HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("ISO-8859-1");
        String Username = request.getParameter("Username");
        String Password = request.getParameter("Password");
        Username= new String(Username.getBytes("ISO-8859-1"),"GB2312");
        Password= new String(Password.getBytes("ISO-8859-1"),"GB2312");
        if(user.Find(Username, Password)==null){    //用户不存在
            if(!user.AddUser(Username, Password))   {
                request.setAttribute("note", "登录/注册失败");
                request.getRequestDispatcher("/Login.jsp").forward(request, response);
            }  //创建用户失败
        }
        request.getSession().setAttribute("Username", Username);
        request.getSession().setAttribute("ClearAll", "1");
        request.getRequestDispatcher("/Home.jsp").forward(request, response);
    }
    protected void doPost(  HttpServletRequest request, 
        HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
