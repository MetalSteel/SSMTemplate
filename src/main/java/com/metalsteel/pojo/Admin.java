package com.metalsteel.pojo;

/**
 * 管理员类
 * Created by Administrator on 2017/4/21.
 */
public class Admin {
    // ID
    private Integer id;
    // 账号
    private String account;
    // 密码
    private String password;
    // 备注信息
    private String mark;

    public Admin() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getMark() {
        return mark;
    }

    public void setMark(String mark) {
        this.mark = mark;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "id=" + id +
                ", account='" + account + '\'' +
                ", password='" + password + '\'' +
                ", mark='" + mark + '\'' +
                '}';
    }
}
