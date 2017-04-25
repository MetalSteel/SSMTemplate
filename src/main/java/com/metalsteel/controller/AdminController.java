package com.metalsteel.controller;

import com.metalsteel.pojo.Admin;
import com.metalsteel.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by Administrator on 2017/4/21.
 */
@Controller
public class AdminController {

    @Autowired
    private AdminService service;

    @RequestMapping(value = "/adminLogin",method = RequestMethod.POST)
    public String adminLogin(Admin admin, HttpServletRequest request, HttpSession session){
        try {
            if(service.adminLogin(admin)){
                session.setAttribute("admin",admin);
                return "redirect:/index";
            }
        } catch (Exception e) {
            request.setAttribute("admin",admin);
            request.setAttribute("msg","用户名或者密码错误");
            e.printStackTrace();
            return "/login";
        }
        request.setAttribute("admin",admin);
        request.setAttribute("msg","用户名或者密码错误");
        return "/login";
    }
}
