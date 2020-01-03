<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="Friends.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>校内网账号注册</title>
    <link rel="stylesheet" href="./bootstrap/dist/css/bootstrap.min.css">
    <script src="./jquery/dist/jquery.js"></script>
    <script src="./jquery-validation/dist/jquery.validate.min.js"></script>
    <script src="./jquery-validation/dist/localization/messages_zh.min.js"></script>
    <style>
        .header {
            width: 100%;
            height: 200px;
        }

        [role="form"] {
            padding: 30px 0 30px 26%;
        }

        .error {
            color: red;
        }
    </style>
    <script>
        $(function () {
            $('#loginForm').validate({
                rules: {
                    username: {
                        required: true
                    },
                    password: {
                        required: true
                    },
                    repassword: {
                        equalTo: '#password'
                    }

                },
                messages: {
                    username: {
                        required: "用户名不能为空"
                    },
                    password: {
                        required: "密码不能为空"
                    },
                    repassword: {
                        equalTo: "两次密码不一致"
                    }
                }
            });
        });
    </script>
</head>

<body style="background-color: #cacec4">
    <div class="header"></div>
    <div class="container">
        <form action="/register.ashx" role="form" class="form-horizontal" id="loginForm">
            <div class="form-group">
                <label for="" class="control-label col-sm-2">用户名</label>
                <div class="col-sm-4">
                    <input type="text" name="username" class="form-control">
                </div>
            </div>
            <div class="form-group">
                <label for="" class="control-label col-sm-2">密码</label>
                <div class="col-sm-4">
                    <input type="password" id="password" name="password" class="form-control">
                </div>
            </div>
            <div class="form-group">
                <label for="" class="control-label col-sm-2">请确定密码</label>
                <div class="col-sm-4">
                    <input type="password" name="repassword" class="form-control">
                </div>
            </div>
            <div class="btn-group col-sm-offset-4">
                <button class="btn btn-default" type="submit">注册</button>
            </div>
        </form>
    </div>
</body>

</html>