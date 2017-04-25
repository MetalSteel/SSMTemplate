<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/22
  Time: 9:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div style="width: 100%;height: 100%;">
    <table id="dg" class="easyui-datagrid" style="width: 100%;height: 100%;">

    </table>
    <div id="tb" style="padding:5px;height:auto">
        <div style="margin-bottom:5px">
            <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="$('#addDialog').dialog('open')">添加客户</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="openUpdateDialog()">更新客户</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="openRemoveDialog()">移除客户</a>
        </div>
        <div id="addDialog" class="easyui-dialog" title="添加客户" data-options="iconCls:'icon-add',closed:true,resizable:false,modal:true" style="width:600px;height:350px;padding:10px">
            <form id="ff" action="<c:url value='/addCustomer'/>" method="post">
                <div style="margin: 15px;">
                    <label style="padding-right:15px;">姓名:</label>
                    <input name="name" class="easyui-textbox" data-options="required:true"/>
                    <label style="padding-left: 50px;padding-right:15px;">性别:</label>
                    <select name="sex" class="easyui-combobox" panelHeight="auto" style="width:100px">
                        <option value="男">男</option>
                        <option value="女">女</option>
                    </select>
                </div>
                <div style="margin: 15px;">
                    <label style="padding-right:15px;">年龄:</label>
                    <input name="age" class="easyui-numberbox" data-options="required:true,min:0,max:120"/>
                    <label style="padding-left: 50px;padding-right:15px;">生日:</label>
                    <input id="birthday_box" name="birthday" type="text" class="easyui-datebox" required="required"/>
                </div>
                <div style="margin: 15px;">
                    <label style="padding-right:15px;">住址:</label>
                    <input name="address" class="easyui-textbox" data-options="required:true" style="width:90%;"/>
                </div>
                <div style="margin: 15px;">
                    <label style="padding-right:15px;">备注:</label>
                    <input name="mark" class="easyui-textbox" name="message" data-options="multiline:true" style="height:100px;width: 90%;"/>
                </div>
                <div style="text-align: center">
                    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="submitForm()">提交表单</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-no" onclick="clearForm()">清空表单</a>
                </div>
                <script>
                    function submitForm(){
                        $('#ff').form('submit',{
                            onSubmit:function(){
                                return $(this).form('enableValidation').form('validate');
                            },
                            success:function(data){
                                var d = JSON.stringify(data);
                                $("#addDialog").dialog({
                                    closed:true
                                });
                                $("#dg").datagrid("reload");
                            }
                        });
                    }
                    function clearForm(){
                        $('#ff').form('clear');
                    }
                </script>
            </form>
        </div>
        <div id="updateDialog" class="easyui-dialog" title="更新客户" data-options="iconCls:'icon-add',closed:true,resizable:false,modal:true" style="width:600px;height:350px;padding:10px">
            <form id="ff2" action="/updateCustomer" method="post">
                <input type="hidden" id="_id" name="id" />
                <div style="margin: 15px;">
                    <label style="padding-right:15px;">姓名:</label>
                    <input id="_name" name="name" class="easyui-textbox" data-options="required:true"/>
                    <label style="padding-left: 50px;padding-right:15px;">性别:</label>
                    <select id="_sex" name="sex" class="easyui-combobox" panelHeight="auto" style="width:100px">
                        <option value="男">男</option>
                        <option value="女">女</option>
                    </select>
                </div>
                <div style="margin: 15px;">
                    <label style="padding-right:15px;">年龄:</label>
                    <input id="_age" name="age" class="easyui-numberbox" data-options="required:true,min:0,max:120"/>
                    <label style="padding-left: 50px;padding-right:15px;">生日:</label>
                    <input id="_birthday" name="birthday" type="text" class="easyui-datebox" required="required"/>
                </div>
                <div style="margin: 15px;">
                    <label style="padding-right:15px;">住址:</label>
                    <input id="_address" name="address" class="easyui-textbox" data-options="required:true" style="width:90%;"/>
                </div>
                <div style="margin: 15px;">
                    <label style="padding-right:15px;">备注:</label>
                    <input id="_mark" name="mark" class="easyui-textbox" name="message" data-options="multiline:true" style="height:100px;width: 90%;"/>
                </div>
                <div style="text-align: center">
                    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="submitForm()">提交表单</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-no" onclick="clearForm()">清空表单</a>
                </div>
            </form>
        </div>
        <script>
            // 打开更新对话框之前,设置表单的值
            function openUpdateDialog() {
                $("#updateDialog").dialog({
                    onOpen:function () {
                        // 判断是否选中Datagrid
                        var row = $("#dg").datagrid('getSelected');
                        if(row){
                            // 设置选中的属性值到表单中
                            $("#_id").attr("value",row.id);
                            $("#_name").textbox('setValue', row.name);
                            $("#_sex").textbox('setValue', row.sex);
                            $("#_age").numberbox('setValue', row.age);
                            $("#_birthday").datebox('setValue', row.birthday);
                            $("#_address").textbox('setValue', row.address);
                            $("#_mark").textbox('setValue', row.mark);
                        }else{
                            alert("请先选中要更新的数据!");
                            $("#updateDialog").dialog({closed:true});
                        }
                    },
                    closed:false
                });
            }
            function submitForm(){
                $('#ff2').form('submit',{
                    onSubmit:function(){
                        return $(this).form('enableValidation').form('validate');
                    },
                    success:function(data){
                        $("#updateDialog").dialog({
                            closed:true
                        });
                        $("#dg").datagrid("reload");
                    }
                });
            }
            function clearForm(){
                $('#ff').form('clear');
            }
            // 移除客户
            function openRemoveDialog() {
                // 判断是否选中Datagrid
                var row = $("#dg").datagrid('getSelected');
                if(row) {
                    $.messager.confirm('删除确认框', '确定要删除该条记录?', function (r) {
                        if (r) {
                            $.ajax({
                                type: 'GET',
                                url: '<c:url value="/deleteCustomer?id='+row.id+'"/>',
                                success: function (data) {
                                    $("#dg").datagrid("reload");
                                }
                            });
                        }
                    });
                }else{
                    alert("请先选中要删除的数据!");
                    $("#updateDialog").dialog({closed:true});
                }
            }
        </script>
        <div>
            姓名: <input id="q_name" name="name" class="easyui-textbox" style="width:70px">
            性别: <select id="q_sex" name="sex" class="easyui-combobox" panelHeight="auto" style="width:80px">
                    <option>无</option>
                    <option value="男">男</option>
                    <option value="女">女</option>
                </select>
            年龄:<input id="q_age" name="age" class="easyui-numberbox" style="width:50px">~
                <input id="q_maxAge" name="maxAge" class="easyui-numberbox" style="width:50px">
            生日:<input id="q_birthday" name="birthday" type="text" class="easyui-datebox" style="width:100px;"/>~
                <input id="q_maxBirthday" name="maxBirthday" type="text" class="easyui-datebox" style="width:100px;"/>
            住址:<input id="q_address" name="address" class="easyui-textbox" style="width:120px">
            备注:<input id="q_mark" name="mark" class="easyui-textbox" style="width:120px">
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="retrieve()">条件检索</a>
        </div>
    </div>
    <script>
        $('#dg').datagrid({
            url:'<c:url value="/retrieve"/>',
            method:'get',
            fitColumns:true,
            singleSelect:true,
            toolbar:'#tb',
            pagination:true,
            striped:true,
            pageSize:10,
            loadMsg:"正在加载数据...",
            columns:[[
                {field:'id',title:'编号',align:'center',width:1},
                {field:'name',title:'姓名',align:'center',width:1},
                {field:'sex',title:'性别',align:'center',width:1},
                {field:'age',title:'年龄',align:'center',width:1},
                {field:'birthday',title:'生日',align:'center',width:1},
                {field:'address',title:'家庭住址',align:'center',width:2},
                {field:'mark',title:'备注信息',align:'center',width:2}
            ]],
            success:function (data) {
                $("#dg").datagrid("loadData", data.rows);  //动态取数据
            }
        });
        // 检索
        function retrieve() {
            $('#dg').datagrid('load', {
                "name":$("#q_name").val(),
                "sex":$("#q_sex").val(),
                "age":$("#q_age").val(),
                "maxAge":$("#q_maxAge").val(),
                "birthday":$("#q_birthday").val(),
                "maxBirthday":$("#q_maxBirthday").val(),
                "address":$("#q_address").val(),
                "mark":$("#q_mark").val()
            });
        }
    </script>
</div>
