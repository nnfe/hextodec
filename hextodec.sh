#!/bin/bash
#16to10

test_var () {
    hexNum=`echo $1 | tr '[:lower:]' '[:upper:]'`
    if [ -z "$1" ] ;
            then
                16to10 $@ ;
            else
                clear
                echo ""
                echo -n "Перевод из десятичной системы в шестнадцатеричную $hexNum = "
                echo "obase=10; ibase=16; $hexNum" | bc ;
                echo ""
    fi
}

16to10 () {
                clear
                echo ""
                echo "Введите шестнадцатеричное число"
                echo ""
                read hexNum
                hexNum=`echo $hexNum | tr '[:lower:]' '[:upper:]'`
				clear
                echo ""
                echo -n "Перевод из шестнадцатеричной системы в десятичную $hexNum = "
                echo "obase=10; ibase=16; $hexNum" | bc ;
                echo ""
}

16to10_help () {
    if [ "$1" = "-h" ] || [ "$1" = "--help" ] ;
        then
        echo "
        Формат команды:
        16to10 10

        16to10 ARG1
                ARG1 - шестнадцатеричное число

                При отсутствии аргументов идёт запрос на ввод числа.
        "
        else
        test_var $@ ;
    fi
};

16to10_help $@ ;

exit 0
