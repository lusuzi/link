#去掉空格
./.bat

files=$(ls)
main=index.html
cat /dev/null > $main
echo '''<!DOCTYPE html><html lang="zh-CN"><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0"><title>目录</title><style>
    p span {
      color: red;
    }
    p span.time {
      color: black;
    }
  </style></head><body><center><h1>目录</h1><p>人生还有<span></span></p>
<script>
  var oSpan = document.getElementsByTagName("span")[0];
  function tow(n) {
    return n >= 0 && n < 10 ? "0" + n : "" + n;
  }
  function getDate() {
    var oDate = new Date();//获取日期对象
    var oldTime = oDate.getTime();//现在距离1970年的毫秒数
    var newDate = new Date("2078/6/1 00:00:00");
    var newTime = newDate.getTime();//2078年距离1970年的毫秒数
    var second = Math.floor((newTime - oldTime) / 1000);//未来时间距离现在的秒数
    var day = Math.floor(second / 86400);//整数部分代表的是天；一天有24*60*60=86400秒；
    second = second % 86400;//余数代表剩下的秒数；
    var hour = Math.floor(second / 3600);//整数部分代表小时；
    second %= 3600; //余数代表 剩下的秒数；
    var minute = Math.floor(second / 60);
    second %= 60;
    var str ="<b>" + tow(day) + "</b>" + "<span class='time'>天</span>"
        + tow(hour) + "<span class='time'>小时</span>"
        + tow(minute) + "<span class='time'>分钟</span>"
        + tow(second) + "<span class='time'>秒</span>";
    oSpan.innerHTML = str;
  }
  getDate();
  setInterval(getDate, 1000);
</script><div>知行合一，逆熵而行</div><ul style="display:inline-block;">''' > $main
for i in $files; do
  if [ $i != 'index.html' ] && [ $i != '.sh' ] && [ $i != '.bat' ] && [ $i != 'images/' ]; then
    echo '<li style="text-align: left;"><a href="'$i'" target="_blank">'$i'</a></li></br>' >> $main
  fi
done
echo '</ul><div><img src="./images/Feynman.jpeg" width="60%" /></div></center></body></html>' >> $main
echo '首页文件生成完毕'

# push to github
git add .
git commit -m "update"
git push