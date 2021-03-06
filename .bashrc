# .bashrc
 
# User specific aliases and functions
 
#alias rm='rm -i'
alias rm='trash' 
alias rl='trashlist' 
alias ur='undelfile' 
#替换rm指令移动文件到~/.trash/中 
trash() 
{ 
 mv $@ ~/.trash/ 
} 
#显示回收站中垃圾清单 
trashlist() 
{ 
 echo -e "33[32m==== Garbage Lists in ~/.trash/ ====33[0m" 
 echo -e "\a33[33m----Usage------33[0m" 
 echo -e "\a33[33m-1- Use 'cleartrash' to clear all garbages in ~/.trash!!!33[0m" 
 echo -e "\a33[33m-2- Use 'ur' to mv the file in garbages to current dir!!!33[0m" 
 ls -al ~/.trash 
} 
#找回回收站相应文件 
undelfile() 
{ 
 mv -i ~/.trash/$@ ./ 
} 
#清空回收站 
cleartrash() 
{ 
 echo -ne "\a33[33m!!!Clear all garbages in ~/.trash, Sure?[y/n]33[0m" 
 read confirm 
 if [ $confirm == 'y' -o $confirm == 'Y' ] ;then 
 /bin/rm -rf ~/.trash/* 
 /bin/rm -rf ~/.trash/.* 2>/dev/null 
 fi 
}
alias cp='cp -i'
alias mv='mv -i'
 
# Source global definitions
if [ -f /etc/bashrc ]; then
 . /etc/bashrc
fi
