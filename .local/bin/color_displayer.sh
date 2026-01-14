#!/bin/bash
# Color displayer for CMD
# Copyright(c) OctHe

# Script about the terminal color in bash
# `\e` means <escape>. `\033` and `\x1B` also work instead of `\e`.
#
# 16 colors: \e[<Mode>;<foreground>;<background>m
#	<Mode> can be emitted, it has follows value 
#	    0: Reset
#	    1: Light
#	    2: Dark
#	    3: Italic
#	    4: Underline
#	    5: Blink (slow)
#	    6: Blink (fast)
#	    7: Reverse
#	    8: Hide
#	    9: Cross-out
#	<foreground>: 30-37 and 90-97 indicate the 16 colors
#	<background>: 40-47 and 100-107 indicate the 16 colors
#
# Example: echo -e '\e[5;33;100mHello'
#   A blink "Hello" with foreground color 33 and background color 100.
#
#
# 256 colors: \e[<Mode];<foreground>;<indicator>;<color>;<background>;<indicator>;<color>m
#   <Mode> is the same with the 16-color case
#	<foreground>: 38
#	<background>: 48
#	<indicator>: 5
#	<color>: 0-255 indicate the 256 colors
#
# Example: echo -e '\e[4;38;5;55;48;5;100mHello'
#   A underline "Hello" with 256 colors. The foreground color is 55 and the background is 100.
#
#
# RGB colors: \e[<Mode];<foreground>;<indicator>;<R>;<G>;<B>;<background>;<indicator>;<R>;<G>;<B>m
#   <Mode> is the same with the 16-color and 256-color cases
#	<foreground> and <background> are the same with the 256-color case
#	<indicator>: 2
#	<R>: 0-255 indicate the red colors
#	<G>: 0-255 indicate the green colors
#	<B>: 0-255 indicate the blue colors
#
# Example: echo -e '\e[9;38;2;255;0;0;48;2;0;0;255mHello'
#   A cross-out red "Hello" with blue background.

for bgcl in {40..47} {100..107} ; do
    for fgcl in {30..37} {90..97} ; do
        for mode in {0..9} ; do
            echo -en "\e[${mode};${bgcl};${fgcl}m \\\e[${mode};${bgcl};${fgcl}m \e[0m"
        done
        echo
    done
done
