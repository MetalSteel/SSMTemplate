package com.metalsteel.service;

import com.metalsteel.pojo.Admin;

/**
 * 管理员操作业务接口
 * Created by Administrator on 2017/4/21.
 */
public interface AdminService {
    // 管理员登录
    boolean adminLogin(Admin admin) throws Exception;
}
