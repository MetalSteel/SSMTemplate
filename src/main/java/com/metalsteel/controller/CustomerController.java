package com.metalsteel.controller;

import com.metalsteel.pojo.Customer;
import com.metalsteel.pojo.CustomerAO;
import com.metalsteel.pojo.CustomerVO;
import com.metalsteel.pojo.Msg;
import com.metalsteel.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 客户操作控制层
 * Created by Administrator on 2017/4/21.
 */
@Controller
public class CustomerController {
    @Autowired
    private CustomerService service;
    // 查找所有客户,并以json形式返回
    @RequestMapping("/findVO")
    public @ResponseBody CustomerVO findAll(Integer page,Integer rows) throws Exception {
        return service.findVO(page,rows);
    }
    // 添加客户
    @RequestMapping(value = "/addCustomer",method = RequestMethod.POST)
    public @ResponseBody Msg addCustomer(Customer customer){
        Msg msg = new Msg();
        try {
            service.addCustomer(customer);
            msg.setStatus("OK");
            msg.setMsg("数据插入成功");
        } catch (Exception e) {
            msg.setStatus("ERROR");
            msg.setMsg("数据插入失败");
            e.printStackTrace();
        }
        return msg;
    }
    // 更新客户
    @RequestMapping("/updateCustomer")
    public @ResponseBody Msg updateCustomer(Customer customer){
        Msg msg = new Msg();
        try {
            service.updateCustomer(customer);
            msg.setStatus("OK");
            msg.setMsg("数据更新成功");
        } catch (Exception e) {
            msg.setStatus("ERROR");
            msg.setMsg("数据更新失败");
            e.printStackTrace();
        }
        return msg;
    }
    // 删除客户
    @RequestMapping("/deleteCustomer")
    public @ResponseBody Msg deleteCustomer(Integer id){
        Msg msg = new Msg();
        try {
            service.deleteCustomer(id);
            msg.setStatus("OK");
            msg.setMsg("数据更新成功");
        } catch (Exception e) {
            msg.setStatus("ERROR");
            msg.setMsg("数据更新失败");
            e.printStackTrace();
        }
        return msg;
    }
    // 检索用户
    @RequestMapping("/retrieve")
    public @ResponseBody CustomerVO retrieve(CustomerAO customerAO,Integer page,Integer rows) throws Exception {
        // 名字转码
        if(customerAO.getName()!=null){
            customerAO.setName(new String(customerAO.getName().getBytes("iso-8859-1"),"utf-8"));
        }
        // 性别转码
        if(customerAO.getSex()!=null){
            customerAO.setSex(new String(customerAO.getSex().getBytes("iso-8859-1"),"utf-8"));
            if(customerAO.getSex().equals("无")){
                customerAO.setSex(null);
            }
        }
        if(customerAO.getAge() == null){
            customerAO.setAge(0);
        }
        if(customerAO.getMaxAge() == null){
            customerAO.setMaxAge(1000);
        }
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date date = null;
        Date maxDate = null;
        try {
            date = format.parse("1900-01-01");
            maxDate = format.parse("2200-01-01");
        } catch (ParseException e) {
            e.printStackTrace();
        }
        if(customerAO.getBirthday() == null){
            customerAO.setBirthday(date);
        }
        if(customerAO.getMaxBirthday() == null){
            customerAO.setMaxBirthday(maxDate);
        }
        // 地址转码
        if(customerAO.getAddress()!=null){
            customerAO.setAddress(new String(customerAO.getAddress().getBytes("iso-8859-1"),"utf-8"));
        }
        // 备注转码
        if(customerAO.getMark()!=null){
            customerAO.setMark(new String(customerAO.getMark().getBytes("iso-8859-1"),"utf-8"));
        }
        return service.retrieve(customerAO,page,rows);
    }
}

