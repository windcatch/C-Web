<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="result.aspx.cs" Inherits="system.result" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>投票结果</title>
    <script src="/Scripts/jquery-3.4.1.js"></script>
    <script src="/Scripts/art-template/lib/template-web.js"></script>
    <script src="/result.js"></script>
</head>

<body>
    <div id="box">

    </div>
    <template id="temp1">
        {{each brandList item index}}
        <div>
         <div>数据{{index+1}}:</div>    
            用户最喜爱的手机品牌投票：<span style="color:blueviolet" >{{item.brand}}</span>。

            周边人用的最多的手机品牌：<span style="color: deeppink">{{item.Qbrand}}</span>。

            将来可能会买的手机品牌：<span style="color: deepskyblue">{{item.Mbrand}}</span>。

            问卷提交时间：<span style="color: #ccc">{{item.time}}</span>
        </div>
        {{/each}}
    </template>
</body>

</html>