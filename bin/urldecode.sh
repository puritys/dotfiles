urldecode() { : "${*//+/ }"; echo -e "${_//%/\\x}"; }

if [ "x" == "x$1" ];then
    echo -e "No Input\n"
else
    echo -e "\n"
    urldecode $1
    echo -e "\n"
fi

