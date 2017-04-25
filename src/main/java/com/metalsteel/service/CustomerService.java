package com.metalsteel.service;

import com.metalsteel.pojo.Customer;
import com.metalsteel.pojo.CustomerAO;
import com.metalsteel.pojo.CustomerVO;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 客户操作接口
 * Created by Administrator on 2017/4/21.
 */
public interface CustomerService {
    // 查找所有用户并分页
    CustomerVO findVO(Integer page,Integer rows) throws Exception;
    // 添加用户
    void addCustomer(Customer customer) throws Exception;
    // 更新用户
    void updateCustomer(Customer customer) throws Exception;
    // 删除用户
    void deleteCustomer(Integer id) throws Exception;
    // 条件检索
    CustomerVO retrieve(CustomerAO customerAO,Integer page,Integer rows) throws Exception;
}
