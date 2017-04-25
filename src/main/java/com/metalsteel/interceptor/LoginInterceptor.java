package com.metalsteel.interceptor;

import com.metalsteel.pojo.Admin;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 登录拦截器
 * Created by Administrator on 2017/4/25.
 */
public class LoginInterceptor implements HandlerInterceptor {
    // 判断用户是否登录是否可以访问一些不可访问的页面和请求
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        // 获取请求的路径
        String uri = httpServletRequest.getRequestURI();
        // 判断是否是登录界面
        if(uri.indexOf("/login")>0){
            return true;
        }
        // 如果不是登录界面,判断是否已经登录了
        Admin admin = (Admin) httpServletRequest.getSession().getAttribute("admin");
        if(admin != null){
            return true;
        }
        // 如果没有登录跳转到登录界面
        httpServletRequest.getRequestDispatcher("/WEB-INF/view/login.jsp").forward(httpServletRequest,httpServletResponse);

        return false;
    }

    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
