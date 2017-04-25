<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/21
  Time: 10:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>登录界面</title>
    <%@include file="common/common_head.jsp"%>
</head>
<body>
    <div style="padding: 200px 450px;">
        <div class="easyui-panel" title="后台系统登录" style="padding:20px 40px;width:400px;">
            <form id="ff" method="post" action="<c:url value="/adminLogin"/>">
                <div style="color: red;margin-bottom:20px;">${msg}</div>
                <div style="margin-bottom:20px">
                    <input class="easyui-textbox" name="account" value="${admin.account}" style="width:100%" data-options="label:'账号:',required:true">
                </div>
                <div style="margin-bottom:20px">
                    <input class="easyui-passwordbox" name="password" value="${admin.password}" style="width:100%" data-options="label:'密码:',required:true">
                </div>
                <input type="submit" value="登录"/>
                <input type="submit" value="清空"/>
            </form>
        </div>
    </div>
    <script>
        function submitForm(){
            $('#ff').form('submit');
        }
        function clearForm(){
            $('#ff').form('clear');
        }
    </script>
</body>
</html>
