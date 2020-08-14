package com.bbb.web;

import com.bbb.entity.Login;
import com.bbb.service.LoginService;
import com.bbb.service.Powerservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
public class LoginWeb
{
    @Autowired
    LoginService log;

    @Autowired
    Powerservice pow;

    @RequestMapping("/log")
    public String login(Login l, Model m,HttpSession hs, ServletRequest req)
    {

      List<Map<String, Object>> list = log.find(l.getE_id(), l.getE_pass());
      if (list.size() >= 1)
      {
          hs.setAttribute("e_id", list.get(0));
          m.addAttribute("list", pow.find(list.get(0).get("r_id")));
          m.addAttribute("listEmp", list);
          return "First";

      } else
      {
          req.setAttribute("error","请输入正确的账号和密码");
          return "login";
      }

    }
    @RequestMapping("end")
    public String end(HttpSession session)
    {
        session.removeAttribute("e_id");
        return "login";
    }
}

