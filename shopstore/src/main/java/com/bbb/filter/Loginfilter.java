package com.bbb.filter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/menu/*")
public class Loginfilter implements Filter
{
    @Override
    public void init(FilterConfig filterConfig) throws ServletException
    {
        System.out.println("诞生了");
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain filterChain) throws IOException, ServletException
    {
        HttpServletRequest hsr =(HttpServletRequest) req;
        hsr.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String url = hsr.getRequestURI();
        System.out.print(url);
        HttpSession hs = hsr.getSession();
        if(hs.getAttribute("e_id") != null|| url.endsWith("log")|| url.endsWith(".png"))
        {
            filterChain.doFilter(req, resp);
            System.out.println("hahaahah");
        }
        else
        {
           req.getRequestDispatcher("login.jsp").forward(req,resp);
        }

    }

    @Override
    public void destroy()
    {
        System.out.println("毁灭了");
    }

}
