$(function () {
    var url = "/getMusic.ashx";
    $.get(url, {
        userId: JSON.parse(localStorage.getItem('userInfo')).userId
        }, function (data) { //请求成功后的回调
                //渲染播放控制台
                var musicList = JSON.parse(data);
                $('.r_top>.title').text(musicList.musicName);
            $('.r_top>.autor').text("-" + musicList.musicAuthor);
            $("#music").attr('src', musicList.musicUrl);
            $('#music')[0].pause();
            $('.left>.pic').attr('src', '/' + musicList.musicImg + '.jpg');
            $("#username").text(JSON.parse(localStorage.getItem('userInfo')).username);
        });
    
    //点击播放按钮切换暂停按钮 播放暂停
    $('.left>.iconfont').click(function () {
        if ($('.left>.iconfont').hasClass('icon-bofang')) {
            $('.left>.iconfont').removeClass('icon-bofang').addClass('icon-tubiaozhizuomoban');
            $('#music')[0].play();
        } else {
            $('.left>.iconfont').addClass('icon-bofang').removeClass('icon-tubiaozhizuomoban');
            $('#music')[0].pause();
        }
    });
    //音乐播放时间变动时 进度条等渲染
    $('#music').on('timeupdate', function () {
        var bgSize = $('#music')[0].currentTime / $('#music')[0].duration * 100 + '%';
        $('.progress').css('background-size', bgSize);
        $('.cur_time').text(toTime($('#music')[0].currentTime));
    });

    //歌曲加载完之后 渲染歌曲的时长等
    $('#music').on('canplay', function () {
        durtime = $('#music')[0].duration;
        $('.duration').text('/' + toTime(durtime));
    });
    //拖动进度条时
    $('.progress').click(function (ev) {
        var x = ev.clientX - $(this)[0].getBoundingClientRect().left;
        $('#music')[0].currentTime = x / $(this).width() * $('#music')[0].duration;
    });

 
    //时长秒转为 00:00格式
    function toTime(num) {
        var str = '';
        var minute = parseInt(num / 60).toString().padStart(2, '0');
        var seccond = parseInt(num % 60).toString().padStart(2, '0');
        str = minute + ':' + seccond;
        return str;
    }
    //00:00格式转为时长 秒
    function toNum(str) {
        var num = 0;
        str.split(':').forEach(function (item, index, a) {
            num = parseInt(a[0]) * 60 + parseFloat(a[1]);
        });
        return num;
    }
});