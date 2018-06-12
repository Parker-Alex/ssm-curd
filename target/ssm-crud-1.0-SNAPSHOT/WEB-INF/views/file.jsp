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
    <form method="post" action="/uploadFile" enctype="multipart/form-data">
        <input type="file" name="file"/>
        <input type="submit"/>
    </form>
</body>
</html>
