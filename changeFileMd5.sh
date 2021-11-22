function readfile ()
{
#这里`为esc下面的按键符号
for file in `ls $1`
do
#这里的-d表示是一个directory，即目录/子文件夹
if [ -d $1"/"$file ]
then
#如果子文件夹则递归
readfile $1"/"$file
else
#否则就能够读取该文件的地址

suffix="${file##*.}"
if [[ $suffix = "png" ]] ||
   [[ $suffix = "jpg" ]]
then
echo $(uuidgen) >> $1"/"$file
#echo $1"/"$file
fi

fi
done
}

if [[  $# > 0 ]]
then
    folder=$1
    readfile $folder
else
    echo "Please input your folder after $0"
fi
