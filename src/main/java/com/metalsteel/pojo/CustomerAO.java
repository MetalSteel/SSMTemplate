package com.metalsteel.pojo;

import java.util.Date;

/**
 * 用于检索的高级Customer对象
 * Created by Administrator on 2017/4/24.
 */
public class CustomerAO extends Customer {
    // 最大年龄
    private Integer maxAge;
    // 最大生日
    private Date maxBirthday;

    public Integer getMaxAge() {
        return maxAge;
    }

    public void setMaxAge(Integer maxAge) {
        this.maxAge = maxAge;
    }

    public Date getMaxBirthday() {
        return maxBirthday;
    }

    public void setMaxBirthday(Date maxBirthday) {
        this.maxBirthday = maxBirthday;
    }
}
