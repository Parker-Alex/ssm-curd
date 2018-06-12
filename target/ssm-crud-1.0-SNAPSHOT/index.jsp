<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2018/6/3
  Time: 16:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>员工信息</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());//该方法是以/开始，但不以/结束
    %>
    <link href="${APP_PATH}/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/js/jquery-3.3.1.min.js"></script>
    <script src="${APP_PATH}/js/bootstrap.min.js"></script>
</head>
<body>

<div class="modal fade" id="selectModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">个人信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal text-center">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Name</label>
                        <div class="col-sm-8">
                            <p class="form-control-static" id="select_name"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-8">
                            <p class="form-control-static" id="select_email"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Gender</label>
                        <div class="col-sm-8">
                            <p class="form-control-static" id="select_gender"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Dept</label>
                        <div class="col-sm-8">
                            <p class="form-control-static" id="select_dept"></p>
                        </div>
                    </div>
                </form>
                <div class="modal-footer">
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 显示单个员工信息模态框 -->
<div class="modal fade" id="empModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="singleModal">个人信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <%--<div class="form-group">--%>
                        <%--<label class="col-sm-2 control-label">ID</label>--%>
                        <%--<div class="col-sm-2">--%>
                            <%--<input class="form-control" name="empId" type="text" id="alter_id" readonly>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Name</label>
                        <div class="col-sm-3">
                            <%--<input class="form-control" name="empName" type="text" id="alter_name" readonly>--%>
                            <p class="form-control-static" id="alter_name"></p>
                            <%--<span class="help-block"></span>--%>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-8">
                            <input type="text" name="email" class="form-control" id="alter_email" placeholder="email@qq.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="alter_inlineRadio1" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="alter_inlineRadio2" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Dept</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId" id="alter_dept">

                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="alter_emp_btn">提交</button>
            </div>
        </div>
    </div>
</div>

<!-- 增加员工信息模态框 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">新增员工</h4>
            </div>
            <div class="modal-body">
                <%--添加员工的表单--%>
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Name</label>
                        <div class="col-sm-8">
                            <input type="text" name="empName" class="form-control" id="add_name" placeholder="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-8">
                            <input type="text" name="email" class="form-control" id="add_email" placeholder="email@qq.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="inlineRadio1" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="inlineRadio2" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Dept</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId" id="add_dept">

                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="save_info">保存</button>
            </div>
        </div>
    </div>
</div>

<%--员工信息表格--%>
<div class="container">
    <%--标题--%>
    <%--<div class="row">--%>
        <%--<div class="col-md-12">--%>
            <%--<h1>SSM-CRUD</h1>--%>
        <%--</div>--%>
    <%--</div>--%>
    <div class="jumbotron">
        <h1>员工列表</h1>
        <p>欢迎来到员工列表，你可以在这里管理员工信息</p>
    </div>

    <%--搜索框--%>
    <div class="row">
        <div class="col-md-8">
            <form class="navbar-form navbar-left" role="search">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search ID" id="select_Id">
                </div>
                <button type="button" class="btn btn-default" id="select_emp_btn">搜索</button>
            </form>
        </div>
    </div>

    <%--按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-success" id="emp_add_modal_btn">新增</button>
            <button class="btn btn-danger" id="emp_del_modal_btn">删除</button>
        </div>
    </div>
    <%--表格数据--%>
    <div class="row">
        <table class="table table-hover" id="emps_table">
            <thead>
            <tr>
                <th>#</th>
                <th>name</th>
                <th>gender</th>
                <th>email</th>
                <th>deptName</th>
                <th>操作</th>
            </tr>
            </thead>

            <tbody>

            </tbody>

        </table>
    </div>
    <%--显示分页--%>
    <div class="row">

        <%--分页信息--%>
        <div class="col-md-6" id="page_info">

        </div>

        <div class="col-md-6" id="page_nav">

        </div>
    </div>
</div>

<div class="alert alert-success" role="alert"></div>

<script type="text/javascript">

    <%--定义全局变量，用来记录总页数和当前页--%>
    var sum;
    var currentPage;

    <%--1.页面加载完成后，发送ajax请求得到数据--%>
    $(function () {
        to_page(1);
    });

    //跳转页面函数
    function to_page(pn) {
        $.ajax({
            url:"${APP_PATH}/emps",//请求的url地址
            data:"pn="+pn,//请求的数据
            type:"GET",//请求的类型
            success:function (result) {//请求成功后的回调函数
                // console.log(result);//在控制台打印出信息
                // 1.解析并显示员工数据
                bulid_emps_table(result);
                // 2.解析并显示分页数据
                bulid_page_info(result);
                bulid_page_nav(result);
            }
        });
    }

    //建立员工信息表格函数
    function bulid_emps_table(result) {
        //开始前先清空，不然会造成信息重合
        $("#emps_table tbody").empty();

        var emps = result.extend.pageInfo.list;
        $.each(emps,function (index,item) {
            // alert(item.empName);
            var empIdTd = $("<td></td>").append(item.empId);
            var empNameTd = $("<td></td>").append(item.empName);
            var genderTd = $("<td></td>").append(item.gender=="M"?"男":"女");
            var emailTd = $("<td></td>").append(item.email);
            var deptNameTd = $("<td></td>").append(item.department.deptName);
        // <button class="btn btn-success btn-sm">
        //     <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
        //     修改
        //     </button>
        //     <button class="btn btn-danger btn-sm">
        //         <span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
        //     删除
        //     </button>
            var editBtn = $("<button></button>").addClass("btn btn-success btn-sm")
                .append($("<span></span>").addClass("glyphicon glyphicon-plus")).append("修改");
            var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm")
                .append($("<span></span>").addClass("glyphicon glyphicon-minus")).append("删除");
            delBtn.addClass("del_btn").attr("del-id",item.empId);//为删除按钮添加一个自定义属性来表示当前删除的员工的id
            editBtn.addClass("edit_btn").attr("edit-id",item.empId);//为修改按钮添加一个自定义属性
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
            //append方法执行完成以后还是返回原来的元素,所以可以循环添加元素
            $("<tr></tr>").append(empIdTd)
                .append(empNameTd)
                .append(genderTd)
                .append(emailTd)
                .append(deptNameTd)
                // .append(editBtn)
                // .append(delBtn)
                .append(btnTd)
                .appendTo("#emps_table tbody");//将该元素添加到指定位置
        });
    }

    //解析分页信息函数
    function bulid_page_info(result){
        $("#page_info").empty();

        $("#page_info").append("当前"+result.extend.pageInfo.pageNum+"页,总"+
            result.extend.pageInfo.pages+"页,总"+
            result.extend.pageInfo.total+"条记录")
            sum = result.extend.pageInfo.total;
            currentPage = result.extend.pageInfo.pageNum;
    }

    //解析导航信息函数
    function bulid_page_nav(result){
        $("#page_nav").empty();

        var ul = $("<ul></ul>").addClass("pagination");

        var firstPage = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        firstPage.click(function () {
            to_page(1);
        })

        var prePage = $("<li></li>").append($("<a></a>").append("&laquo;"));
        prePage.click(function () {
            to_page(result.extend.pageInfo.pageNum - 1);
        })

        if (result.extend.pageInfo.hasPreviousPage == false){
            firstPage.addClass("disabled");
            prePage.addClass("disabled");
        }

        var nextPage = $("<li></li>").append($("<a></a>").append("&raquo;"));
        nextPage.click(function () {
            to_page(result.extend.pageInfo.pageNum + 1);
        })

        var lastPage = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
        lastPage.click(function () {
            to_page(result.extend.pageInfo.pages);
        })

        if (result.extend.pageInfo.hasNextPage == false){
            nextPage.addClass("disabled");
            lastPage.addClass("disabled");
        }


        ul.append(firstPage).append(prePage);

        $.each(result.extend.pageInfo.navigatepageNums,function (index,item) {
            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if (result.extend.pageInfo.pageNum == item){
                numLi.addClass("active");
            }
            numLi.click(function () {
                to_page(item);
            });
            ul.append(numLi);
        });

        ul.append(nextPage).append(lastPage);
        var nav = $("<nav></nav>").append(ul);
        nav.appendTo("#page_nav");
    }

    function reset_form(ele){
        //重置表单样式,还有表单中的信息
        $(ele)[0].reset();
        $(ele).find("*").removeClass("has-success has-error");
        $(ele).find(".help-block").text("");
    }

    //为增加员工模态框中的"增加"按钮添加点击事件
    $("#emp_add_modal_btn").click(function () {
        //表单重置
        // $("#myModal form")[0].reset();//jquery中无表单重置方法，是dom的对象的方法，所以需转为dom对象
        reset_form("#myModal form");
        //先调用查询部门，在启动模态框
        select_dept("#add_dept");
        //启动模态框
        $("#myModal").modal({
            backdrop:"static"
        });
    });

    //查询部门函数
    function select_dept(ele) {
        $(ele).empty();
        $.ajax({
            url:"${APP_PATH}/depts",
            type:"GET",
            success:function (result) {
                // console.log(result);
                $.each(result.extend.deptInfo,function(index,item) {
                    var op = $("<option></option>").append(item.deptName).attr("value",item.deptId);
                    op.appendTo(ele);
                });
            }
        });
    }

    //员工信息验证函数
    function verify_emp(){
        //验证姓名
        var empName = $("#add_name").val();
        var verName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
        if (!verName.test(empName)){
            show_validate_m("#add_name","error","姓名不能为空或格式不正确!!!");
            return false;
        }else{
            show_validate_m("#add_name","success","");
        }

        //验证电子邮箱
        var empEmail = $("#add_email").val();
        var verEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!verEmail.test(empEmail)){
           show_validate_m("#add_email","error","电子邮件不能为空或格式不正确!!!");
            return false;
        }else{
            show_validate_m("#add_email","success","");
        }
        return true;
    }

    //显示验证提示信息函数
    function show_validate_m(ele,status,msg){//参数为当前元素，状态信息，提示信息
        //每次调用函数都先清除当前元素的验证状态
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next().text("");
        if ("success" == status) {
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);
        }else if ("error" == status) {
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }
    }

    //检验名字是否可用
    $("#add_name").change(function () {
        var empName = this.value;
        $.ajax({
            url:"${APP_PATH}/checkName",
            data:"empName="+empName,
            type:"POST",
            success:function (result) {
                if (result.code == 100){
                    show_validate_m("#add_name","success","用户名可用");
                    $("#save_info").attr("ajax-validate","success");//为保存按钮添加属性
                }else if(result.code == 200){
                    show_validate_m("#add_name","error",result.extend.message);
                    $("#save_info").attr("ajax-validate","error");
                }
            }
        });
    });

    //为添加员工模态框中的"保存员工信息"按钮添加点击事件
    $("#save_info").click(function () {
        提交数据保存前先调用验证函数
        if (!verify_emp()) {
            return false;
        };

        if ($(this).attr("ajax-validate") == "error"){
            return false;
        }

        //发送ajax请求保存员工信息
        $.ajax({
            url:"${APP_PATH}/emps",
            type:"POST",
            data:$("#myModal form").serialize(),//将表单的数据序列化为字符串
            success:function (result) {
                // alert(result.msg);
                //根据返回结果的状态码进行判断
                //当成功时，关闭模态框，跳转页面
                if (result.code == 100) {
                    $("#myModal").modal("hide");
                    to_page(sum);
                }else if (result.code == 200){
                    //console.log(result);
                    //如果是电子邮箱验证错误,提示相关信息
                    if (undefined != result.extend.errorInfo.email) {
                        show_validate_m("#add_email","error",result.extend.errorInfo.email);
                    }
                    //如果是名字验证错误,提示相关信息
                    if (undefined != result.extend.errorInfo.empName){
                        show_validate_m("#add_name","error",result.extend.errorInfo.email);
                    }
                }
            }
        });
        // alert($("#myModal form").serialize());
    });

    //单个删除员工
    $(document).on("click",".del_btn",function () {
        var empName = $(this).parents("tr").find("td:eq(1)").text();
        var empId = $(this).attr("del-id");//得到自定义del-id属性的值
        // alert($(this).parents("tr").find("td:eq(1)").text());//找到当前元素的所有父类中的tr，然后从父类找下面的第二个td中的内容
        if (confirm("确定要删除"+empName+"吗？")) {
            $.ajax({
                url:"${APP_PATH}/emp/"+empId,
                type:"DELETE",
                success:function (result) {
                    alert(result.msg);
                    to_page(currentPage);
                }
            });
        }
    });

    //修改个人信息
    $(document).on("click",".edit_btn",function () {
        // $("#alter_name").empty();//先清空文本内容，在显示姓名，不然会叠加
        var empName = $(this).parents("tr").find("td:eq(1)").text();//得到员工姓名
        var empId = $(this).attr("edit-id");

        $("#alter_id").attr("value",empId);
        $("#alter_name").attr("value",empName);
        // $("#alter_name").append(empName);//将名字加到元素中

        //查询部门
        select_dept("#alter_dept");

        //查询员工信息并显示到模态框中
        select_emp(empId);

        //启动模态框之前为修改中提交员工信息按钮自定义属性
        $("#alter_emp_btn").attr("emp_id",empId);

        //启动模态框
        $("#empModal").modal({
            backdrop:"static"
        });



    });

    //提交修改员工信息按钮事件
    $("#alter_emp_btn").click(function () {
        if (!validateEmail()) {
            return false;
        }

        $.ajax({
            url:"${APP_PATH}/alter/"+$(this).attr("emp_id"),
            type:"POST",//如果直接用PUT请求，将会发生错误。因此若想使用直接PUT方法，要在web.xml中配置HttpPutFormContentFilter.
            data:$("#empModal form").serialize()+"&_method=PUT",//将请求转化为PUT
            success:function (result) {
                // alert(result.msg);
                $("#empModal").modal("hide");
                to_page(currentPage);
            }
        });
        // alert($("#empModal form").serialize());
    });

    //查询单个员工
    function select_emp(id) {
        $.ajax({
            url:"${APP_PATH}/select/"+id,
            type:"GET",
            success:function (result) {
                // console.log(result);
                var empData = result.extend.emp;
                $("#alter_name").text(empData.empName);
                $("#alter_email").val(empData.email);
                $("#empModal input[name=gender]").val([empData.gender]);
                $("#alter_dept").val([empData.dId]);
            }
        });
    };

    function validateEmail() {
        var empEmail = $("#alter_email").val();
        var verEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!verEmail.test(empEmail)) {
            show_validate_m("#alter_email","error","电子邮件格式不正确!!!");
            return false;
        }else {
            show_validate_m("#alter_email","success","");
        }
        return true;
    }

    $("#select_emp_btn").click(function () {

        if ($("#select_Id").val() == 0) {
            alert("请输入ID");
            return false;
        }

        $.ajax({
            url:"${APP_PATH}/select/"+$("#select_Id").val(),
            type:"GET",
            success:function (result) {
                // console.log(result);
                var emp = result.extend.emp;
                $("#select_name").text(emp.empName);
                $("#select_email").text(emp.email);
                $("#select_gender").text(emp.gender=="M"?"男":"女");
                $("#select_dept").text(emp.dId==1?"开发部":"测试部");
            }
        });

        $("#selectModal").modal({
            backdrop:"static"
        });
    });
</script>

</body>
</html>
