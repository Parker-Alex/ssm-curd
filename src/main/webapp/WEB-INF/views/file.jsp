<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2018/6/12
  Time: 16:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>上传文件</title>
</head>
<body>
<%--刚开始用自动提示的"multipart/form-data"会出现该请求不是multipart错误，手动输入后就没有问题了--%>
    <h3>文件上传</h3>
    <form method="post" action="/uploadFile" enctype="multipart/form-data">
        <input type="file" name="file"/>
        <input type="submit"/>
    </form>
    <br>
    <h3>文件下载</h3>
    <a href="down?filename=1.jpg">下载</a>
</body>
</html>
