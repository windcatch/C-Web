﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Friends.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>我的校内网</title>
    <link rel="stylesheet" href="/zTree_v3/css/demo.css">
    <link rel="stylesheet" href="/zTree_v3/css/zTreeStyle/zTreeStyle.css">
    <script src="/jquery/dist/jquery.min.js"></script>
    <script src="/zTree_v3/js/jquery.ztree.core.js"></script>
    <script>
        function zTreeOnClick(event, treeId, treeNode) {
            if (treeNode.id != "exit"&&treeNode.id) {
                $("#iframe").attr("src", "/" + treeNode.id)
            }
            else if(treeNode.id == "exit"){
                window.location.href="/login";
            }
        };
        //树的配置
        var setting = {
            //数据格式的设置
            data: {
                simpleData: {
                    enable: true //使用简单的json数据
                }
            },
            //树的显示设置
            view: {
                showLine: true, //设置是否显示连线 默认为true
                showTitle: false, //设置是否显示鼠标悬浮时显示title的效果
                dblClickExpand: true, //设置是否支持双击展开树节点
                fontCss: {
                    "color": "#1E1E1E"
                }, //设置节点样式  
                expandSpeed: "slow", //设置展开的速度  fast normal  slow 
                nameIsHTML: true, //名字是否是HTML

            },
            //设置事件回调
            callback: {
                onClick: zTreeOnClick
            }
        };
        var zNodes = [{
            name: "我的平台",
            open: true,
            iconOpen:"/zTree_v3/css/zTreeStyle/img/diy/1_open.png",
            iconClose:"/zTree_v3/css/zTreeStyle/img/diy/1_close.png",
            children: [{
                    name: "我的好友",
                    id: "myFriend",
                    icon:""
                },
                {
                    name: "退出",
                    id: "exit",
                    icon:""
                }
            ]
        }];
        $(function () {
            $.fn.zTree.init($("#treeDemo"), setting, zNodes);
        })
    </script>
    <style>
        .right {
            width: 900px;
            height: 250px;
            margin-left: 40px;
            margin-top: 30px;
            background-color: #f6fcea;
            border-radius: 5px;
            /* border: 1px solid #617775; */
            float: left;
            text-align: center;
        }

        .right>iframe {
            margin-top: 15px;
        }
    </style>
</head>

<body style="background-color: #cacec4">
    <div class="zTreeDemoBackground left" style="float: left">
        <ul id="treeDemo" class="ztree" style="border-radius: 5px;border: 1px solid #f6fcea;"></ul>
    </div>
    <div class="right">
        <iframe src="" frameborder="0" width="96%" height="90%" id="iframe"></iframe>
    </div>
</body>
</html>
