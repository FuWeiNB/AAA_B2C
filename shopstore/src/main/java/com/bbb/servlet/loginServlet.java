package com.bbb.servlet;

import com.bbb.dao.AdminDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

//登录servlet
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet
{
    private static final long serialVersionUID = 1L;

    public loginServlet()
    {
        super();

    }

    AdminDao dao = new AdminDao();
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        //获取页面上传来的信息
        request.setCharacterEncoding("utf-8");
        String name = request.getParameter("name");
        String pass= request.getParameter("pass");
        HttpSession session = request.getSession();
        //String email = request.getParameter("email");
        //String phone = request.getParameter("phone");

        Map<String , Object> map = dao.adminlogin(name,pass);


        if(map == null || map.size() == 0)
        {
            request.setAttribute("msg", "输入信息有误或者已被禁用，请联系客服！");

            request.getRequestDispatcher("login/beforeLogin.jsp").forward(request, response);
        }

        else
        {
            //设置保存时间
            session = request.getSession();

            session.setMaxInactiveInterval(30000);

            //把获取到的信息发到session中
            session.setAttribute("$MAP",map);
            session.setAttribute("admin_name",name);
            session.setAttribute("user",map.get("user"));
            //session.setAttribute("$Map",map);

            response.sendRedirect("/index.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

        doGet(request, response);
    }
}
