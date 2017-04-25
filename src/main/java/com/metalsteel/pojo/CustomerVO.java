package com.metalsteel.pojo;

import java.util.List;

/**
 * datagrid查询使用的类
 * Created by Administrator on 2017/4/22.
 */
public class CustomerVO {
    private long total;
    private List<Customer> rows;

    public long getTotal() {
        return total;
    }

    public void setTotal(long total) {
        this.total = total;
    }

    public List<Customer> getRows() {
        return rows;
    }

    public void setRows(List<Customer> rows) {
        this.rows = rows;
    }
}
