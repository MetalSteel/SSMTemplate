package com.metalsteel.mapper;

import com.metalsteel.pojo.Admin;

/**
 * 管理持久层操作接口
 * Created by Administrator on 2017/4/21.
 */
public interface AdminMapper {
    // 查找Admin
    Admin findAdmin(Admin admin) throws Exception;
}
