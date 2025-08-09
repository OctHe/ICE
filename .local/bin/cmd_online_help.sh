#!/bin/bash
#
# Online help for command line

if which lynx > /dev/null 2>&1; then
    if [ $# != 1 ]; then
        echo "Usage: "
        echo "    gl_oh bash "
        echo "    gl_oh texinfo "
        return
    fi

    case $1 in
        bash) url=https://www.gnu.org/software/bash/manual/bash.html ;;
        texinfo) url=https://www.gnu.org/software/texinfo/manual/texinfo/texinfo.html ;;
        *) ;;
    esac

    lynx ${url}

else
    echo "Online help requires lynx!"
    echo "Please install it with package manager"
fi

