package com.metalsteel.service.impl;

import com.metalsteel.mapper.AdminMapper;
import com.metalsteel.pojo.Admin;
import com.metalsteel.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 管理员业务操作实现类
 * Created by Administrator on 2017/4/21.
 */
@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper mapper;
    // 管理员登录实现
    public boolean adminLogin(Admin admin) throws Exception {
        Admin _admin = mapper.findAdmin(admin);
        if(_admin == null){
            return false;
        }
        return true;
    }
}
