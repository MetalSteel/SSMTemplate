<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/21
  Time: 8:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>后台管理系统</title>
    <link rel="stylesheet" type="text/css" href="/static/css/index.css"/>
    <%@include file="common/common_head.jsp"%>
</head>
<body style="margin: 0px;">
    <div class="easyui-layout" style="width:100%;height:100%;">
        <div data-options="region:'north'" style="height:80px;background: linear-gradient(to right, white , #A8D6F6);">
            <div style="float: left;">
                <img src="<c:url value="/static/img/Logo.png"/>" style="width:60px;height: 60px;margin:9px;float: left;"/>
                <p style="float: right;font-size:30px;margin: 0px;line-height: 78px;color: #00bbee;">后台管理系统</p>
            </div>
            <div style="float: right;width: 300px;">
                <img src="<c:url value="/static/img/admin.png"/>" style="width:20px;height: 20px;margin:29px 5px;float: left;">
                <p style="float: left;font-size:15px;margin: 0px;line-height: 78px;color: A9A9A9;">欢迎您,${admin.account}</p>
                <img src="<c:url value="/static/img/logout.png"/>" style="width:18px;height: 18px;margin:30px 5px;float: left;padding-left:10px;">
                <p style="float: left;font-size:15px;margin: 0px;line-height: 78px;">
                    <a href="#" style="color: #A9A9A9;text-decoration: none;">退出系统</a>
                </p>
            </div>
        </div>
        <div data-options="region:'south'" style="height:80px;">
            <p style="margin: 0px auto;line-height: 75px;text-align: center;">版权所有:MetalSteel 联系电话:18964780700</p>
        </div>
        <div data-options="region:'east'" title="联系目录" style="width:150px;">

        </div>
        <div data-options="region:'west'" title="主菜单" style="width:200px;">
            <div class="easyui-accordion" style="border-left: none;border-right:none;">
                <div title="系统管理" data-options="iconCls:'icon-man'" style="overflow:auto;padding:10px;">
                    <a class="custom_menu_item" href="javascript:void(0)" onclick="addTab('客户管理','<c:url value="/customerManage"/>')">客户管理</a>
                    <a class="custom_menu_item" href="javascript:void(0)" onclick="addTab('管理员管理','<c:url value="/adminManage"/>')">管理员管理</a>
                </div>

                <div title="TreeMenu" data-options="iconCls:'icon-search'" style="padding:10px;">
                </div>
            </div>
        </div>
        <div data-options="region:'center'">
            <div id="tt" class="easyui-tabs" data-options="tools:'#tab-tools'" style="width:100%;height:100%;border:none;"></div>
        </div>
    </div>
</body>
</html>
<script type="text/javascript">
    function addTab(title, url){
        if ($('#tt').tabs('exists', title)){
            $('#tt').tabs('select', title);
        } else {
            $('#tt').tabs('add',{
                title:title,
                href:url,
                closable:true
            });
        }
    }
</script>