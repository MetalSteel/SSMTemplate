package com.metalsteel.controller;

import com.metalsteel.pojo.Admin;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/**
 * Created by Administrator on 2017/4/21.
 */
@Controller
public class IndexController {

    @RequestMapping("/{view}")
    public String view(@PathVariable("view")String view){
        return view;
    }
    // 客户管理
    @RequestMapping("/customerManage")
    public String customerManage(){
        return "functions/customer_manage";
    }
    // 管理员管理
    @RequestMapping("/adminManage")
    public String adminManage(){
        return "functions/admin_manage";
    }

    @RequestMapping("/index")
    public String view(HttpSession session){

        Admin admin = (Admin) session.getAttribute("admin");
        if(admin!=null){
            return "/index";
        }else {
            return "redirect:/login";
        }
    }
}
