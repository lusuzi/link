#去掉空格
./.bat

files=$(ls)
main=index.html
cat /dev/null > $main
echo '<!DOCTYPE html><html lang="zh-CN"><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0"><title>目录</title></head><body><center><h1>目录</h1><ul style="display:inline-block;">' > $main
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