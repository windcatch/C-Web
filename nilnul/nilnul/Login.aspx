<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="nilnul.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>登录页-请登录个人信息</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!--[if lt IE 9]>
         <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
         <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
      <![endif]-->
    <script src="/Scripts/jquery-3.4.1.min.js"></script>
    <script src="/Scripts/layer-v3.1.1/layer/layer.js"></script>
    <script src="/login.js"></script>
</head>

<body>
    <div class="container" style="margin:150px auto">
        <form  class="form-horizontal">
            <div class="form-group">
                <label class="control-label col-md-3" for="username">用户名</label>
                <div class="col-md-6">
                    <input class="form-control" type="text" name="username" placeholder="请输入您的用户名" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-3" for="password">密码</label>
                <div class="col-md-6">
                    <input class="form-control" type="password" name="password" placeholder="请输入您的密码" />
                </div>
            </div>
            <button type="button" id="loginIn" class="btn btn-success col-md-offset-8">登录</button>
        </form>
    </div>
  
</body>

</html>