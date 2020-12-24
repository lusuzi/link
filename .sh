#去掉空格
./.bat

files=$(ls)
main=index.html
cat /dev/null > $main
echo '<!DOCTYPE html><html lang="zh-CN"><head><meta charset="UTF-8"><title>目录</title></head><body><center><h1>目录</h1><ul style="display:inline-block;">' > $main
for i in $files; do
  if [ $i != 'index.html' ] && [ $i != '.sh' ] && [ $i != '.bat' ]; then
    echo '<li style="text-align: left;"><a href="'$i'" target="_blank">'$i'</a></li></br>' >> $main
  fi
done
echo '</ul></center></body></html>' >> $main
echo '首页文件生成完毕'