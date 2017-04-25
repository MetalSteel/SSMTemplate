package com.metalsteel.mapper;

import com.metalsteel.pojo.Customer;
import com.metalsteel.pojo.CustomerAO;

import java.util.List;

/**
 * 客户持久化操作接口
 * Created by Administrator on 2017/4/21.
 */
public interface CustomerMapper {
    // 查找所有客户
    List<Customer> findAll() throws Exception;
    // 添加客户
    void addCustomer(Customer customer) throws Exception;
    // 更新客户
    void updateCustomer(Customer customer) throws Exception;
    // 删除客户
    void deleteCustomer(Integer id) throws Exception;
    // 条件检索
    List<Customer> retrieve(CustomerAO customerAO) throws Exception;
}
