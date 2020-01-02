<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="vote.aspx.cs" Inherits="system.vote" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>调查问卷-请开始答题</title>
    <link rel="stylesheet" href="/Scripts/bootstrap/dist/css/bootstrap.min.css">
    <script src="/Scripts/jquery-3.4.1.min.js"></script>
    <script src="/Scripts/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="/Scripts/layer-v3.1.1/layer/layer.js"></script>
    <script src="/vote.js"></script>
</head>

<body>
    <div class="container">
        <div>
            <div class="panel panel-default" data-num="1">
                <div class="panel-heading">第一题</div>
                <div class="panel-body">
                    <p>您最喜欢用哪种品牌的手机？</p>
                </div>
                <ul class="list-group">
                    <li class="list-group-item"><label for="apple"><input type="radio" name="brand"
                                id="apple" value="苹果">苹果</label>
                    </li>
                    <li class="list-group-item"><label for="huawei"><input type="radio" name="brand"
                                id="huawei" value="华为">华为</label>
                    </li>
                    <li class="list-group-item"><label for="mi"><input type="radio" name="brand" id="mi" value="小米">小米</label></li>
                    <li class="list-group-item"><label for="oppo"><input type="radio" name="brand"
                                id="oppo" value="OPPO">OPPO</label>
                    </li>
                    <li class="list-group-item"><label for="sanxing"><input type="radio" name="brand"
                                id="sanxing" value="三星">三星</label></li>
                    <li class="list-group-item"><label for="vivo"><input type="radio" name="brand"
                                id="vivo" value="vivo">vivo</label>
                    </li>
                    <li class="list-group-item"><label for="yijia"><input type="radio" name="brand"
                                id="yijia" value="一加">一加</label>
                    </li>
                    <li class="list-group-item"><label for="meizu"><input type="radio" name="brand"
                                id="meizu" value="魅族">魅族</label>
                    </li>
                    <li class="list-group-item"><label for="zhongxing"><input type="radio" name="brand"
                                id="zhongxing" value="中兴">中兴</label></li>
                </ul>
            </div>
            <div class="panel panel-default" data-num="2">
                <div class="panel-heading">第二题</div>
                <div class="panel-body">
                    <p>您的亲人使用最多的是哪款手机？</p>
                </div>
                <ul class="list-group">
                    <li class="list-group-item"><label for="Qapple"><input type="radio" name="Qbrand"
                                id="Qapple" value="苹果">苹果</label>
                    </li>
                    <li class="list-group-item"><label for="Qhuawei"><input type="radio" name="Qbrand"
                                id="Qhuawei" value="华为">华为</label>
                    </li>
                    <li class="list-group-item"><label for="Qmi"><input type="radio" name="Qbrand" id="Qmi" value="小米">小米</label>
                    </li>
                    <li class="list-group-item"><label for="Qoppo"><input type="radio" name="Qbrand"
                                id="Qoppo" value="OPPO">OPPO</label>
                    </li>
                    <li class="list-group-item"><label for="Qsanxing"><input type="radio" name="Qbrand"
                                id="Qsanxing" value="三星">三星</label></li>
                    <li class="list-group-item"><label for="Qvivo"><input type="radio" name="Qbrand"
                                id="Qvivo" value="vivo">vivo</label>
                    </li>
                    <li class="list-group-item"><label for="Qyijia"><input type="radio" name="Qbrand"
                                id="Qyijia" value="一加">一加</label>
                    </li>
                    <li class="list-group-item"><label for="Qmeizu"><input type="radio" name="Qbrand"
                                id="Qmeizu" value="魅族">魅族</label>
                    </li>
                    <li class="list-group-item"><label for="Qzhongxing"><input type="radio" name="Qbrand"
                                id="Qzhongxing" value="中兴">中兴</label></li>
                </ul>
            </div>
            <div class="panel panel-default" data-num="3">
                <div class="panel-heading">第三题</div>
                <div class="panel-body">
                    <p>下次您可能会买的手机款式？</p>
                </div>
                <ul class="list-group">
                    <li class="list-group-item"><label for="Mapple"><input type="checkbox" name="Mbrand"
                                id="Mapple" value="苹果">苹果</label>
                    </li>
                    <li class="list-group-item"><label for="Mhuawei"><input type="checkbox" name="Mbrand"
                                id="Mhuawei" value="华为">华为</label>
                    </li>
                    <li class="list-group-item"><label for="Mmi"><input type="checkbox" name="Mbrand"
                                id="Mmi" value="小米">小米</label></li>
                    <li class="list-group-item"><label for="Moppo"><input type="checkbox" name="Mbrand"
                                id="Moppo" value="OPPO">OPPO</label>
                    </li>
                    <li class="list-group-item"><label for="Msanxing"><input type="checkbox" name="Mbrand"
                                id="Msanxing" value="三星">三星</label></li>
                    <li class="list-group-item"><label for="Mvivo"><input type="checkbox" name="Mbrand"
                                id="Mvivo" value="vivo">vivo</label>
                    </li>
                    <li class="list-group-item"><label for="Myijia"><input type="checkbox" name="Mbrand"
                                id="Myijia" value="一加">一加</label>
                    </li>
                    <li class="list-group-item"><label for="Mmeizu"><input type="checkbox" name="Mbrand"
                                id="Mmeizu" value="魅族">魅族</label>
                    </li>
                    <li class="list-group-item"><label for="Mzhongxing"><input type="checkbox" name="Mbrand"
                                id="Mzhongxing" value="中兴">中兴</label></li>
                </ul>
            </div>
        </div>
        <div class="btn-group col-md-11">
            <button class="btn btn-default" id="prev">上一题</button>
            <button class="btn btn-default" id="next">下一题</button>
        </div>
        <div>
            <button class="btn btn-success" id="submit">提交</button>
        </div>
    </div>
</body>

</html>