﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="messageBoard.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>用户登录-留言板</title>
    <link rel="stylesheet" href="/node_modules/bootstrap/dist/css/bootstrap.min.css">
    <script src="/node_modules/jquery/dist/jquery.min.js"></script>
    <script src="/node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="/node_modules/jquery-validation/dist/jquery.validate.min.js"></script>
    <script src="/node_modules/jquery-validation/dist/localization/messages_zh.min.js"></script>
    <style>
        .header {
            width: 100%;
            height: 186px;
            background-image: url("/topbg.jpg");
            background-repeat: no-repeat;
            background-size: 100%;
        }
        body {
            background-color: #FBFCF6;
            color: #333;
        }
        [role="form"] {
            background: url("/p1bg.jpg") no-repeat top;
            padding: 30px 0 30px 8%;
        }
        .error{
            color: rgb(250, 14, 14);
        }
    </style>
    <script>
        $(function () {
        $('#loginForm').validate({
           rules:{
               username:{
                   required:true
               },
               password:{
                   required:true
               }
           },
           messages:{
               username:{
                   required:"用户名不能为空"
               },
               password:{
                   required:"密码不能为空"
               }
           }
        });
    });
    </script>
</head>

<body>
    <div class="header"></div>
    <div class="container">
        <form action="/login.ashx" role="form" class="form-horizontal" id="loginForm">
            <div class="form-group">
                <label for="" class="control-label col-sm-2">用户名</label>
                <div class="col-sm-7">
                    <input type="text" name="username" class="form-control">
                </div>
            </div>
            <div class="form-group">
                <label for="" class="control-label col-sm-2">密码</label>
                <div class="col-sm-7">
                    <input type="password" name="password" class="form-control">
                </div>
            </div>
            <div class="btn-group col-sm-offset-7">
                <button class="btn btn-default" type="submit">登录</button>
                <a class="btn btn-default" href="/register">注册</a>
            </div>
        </form>
    </div>
</body>
</html>
