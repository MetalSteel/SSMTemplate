package com.metalsteel.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.metalsteel.mapper.CustomerMapper;
import com.metalsteel.pojo.Customer;
import com.metalsteel.pojo.CustomerAO;
import com.metalsteel.pojo.CustomerVO;
import com.metalsteel.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * 客户业务操作接口的实现
 * Created by Administrator on 2017/4/21.
 */
@Service
public class CustomerServiceImpl implements CustomerService {
    @Autowired
    private CustomerMapper mapper;
    // 查找所有用户并分页
    public CustomerVO findVO(Integer page,Integer rows) throws Exception {
        CustomerVO vo = new CustomerVO();
        //获取第1页，10条内容，默认查询总数count
        PageHelper.startPage(page, rows);
        List<Customer> list = mapper.findAll();
        //用PageInfo对结果进行包装
        PageInfo<Customer> p = new PageInfo<Customer>(list);
        vo.setTotal(p.getTotal());
        vo.setRows(p.getList());
        return vo;
    }
    // 添加用户
    public void addCustomer(Customer customer) throws Exception {
        mapper.addCustomer(customer);
    }
    // 更新用户
    public void updateCustomer(Customer customer) throws Exception {
        mapper.updateCustomer(customer);
    }
    // 删除用户
    public void deleteCustomer(Integer id) throws Exception {
        mapper.deleteCustomer(id);
    }
    // 检索用户并分页
    public CustomerVO retrieve(CustomerAO customerAO,Integer page,Integer rows) throws Exception {
        // 分页
        PageHelper.startPage(page,rows);
        // 查询
        List<Customer> list = mapper.retrieve(customerAO);
        // 封装
        PageInfo<Customer> pageInfo = new PageInfo<Customer>(list);
        // 结果
        CustomerVO customerVO = new CustomerVO();
        customerVO.setTotal(pageInfo.getTotal());
        customerVO.setRows(pageInfo.getList());

        return customerVO;
    }
}
