# CIM Cheatsheet

Vim has six modes: normal, insert, operator-pending, visual, select, and command-line modes.
All the keys in the keyboard have been used as a command in these mode.
This cheatsheet summarizes all single-character and part of the related commands.

The full list can be obtained by using `:help index`.

## Normal Mode

### Movement

```
h/j/k/l     Character-level movement: left/down/up/right
F/f{char}   Character-level movement: Find the {char} on left/right
T/t{char}   Character-level movement: Till (Find) before/after {char} on left/right
;           Repeat: F/f/T/t
,           Repeat: F/f/T/t in opposite direction
w/W         Word-level movement: forward to the begin of the word/WORD 
e/E         Word-level movement: forward to the end of the word/WORD 
b/B         Word-level movement: backward to the begin of the word/WORD 
0/$         Line-level movement: Begin/End of the line
^           Line-level movement: The first non-blank character of the line
{count}|    Line-level movement: The {Count} column in this line
+/-         Line-level movement: Downward/Upward
{count}_    Line-level movement: Downward {count}-1 lines, on the first non-blank character
H/M/L       Window-level movement: Top/Middle/Bottom of the window
G           Document-level movement: End of the document
K           Run an external predefined program with word (i.e., !{Program} {word})
```

### Edit and Register

Replace, delete, and yank commands in normal mode save the characters in to registers.

```
r/R         Character-level edit: Replace/Enter replace mode
X/x         Character-level edit: Delete at previous/current cursor
s           Character-level edit: Delete and enter the insert mode
~           Character-level edit: Swap case
D           Line-level edit: Delete (cut) from the cursor to the end
S           Line-level edit: Delete (cut) the line and enter the insert mode
C           Line-level edit: Delete from the cursor to the end and enter the insert mode
Y           Line-level edit: Yank the line
J           Line-level edit: Join the forward line to the current one
P/p         Document-level edit: Put (Paste) the text before/after the cursor
u/U         Document-level edit: Undo the last change / Undo all changes in the line
.           Repeat: The last edit command
"{reg}      Use {reg} for d/y/p
```

`d/c/y/</>` are operators.
If an operator is typed, it will wait for a motion, like `h/j/k/l/w/W/e/E/b/B`.
Type an operator twice indicates line-level edit.

```
d/y         Delete (Cut) / Yank
c           Delete (Cut/Change) and enter the insert mode
<           Shift left
>           Shift right
dd/yy       Line-level edit: Delete (Cut) / Yank
cc          Line-level edit: Delete and enter the insert mode
<<          Line-level edit: Shift left
>>          Line-level edit: Shift right
```

Register-related Command-line mode command 

```
:reg        Show the registers
```

### Recording

```
q{reg}      Recording operations into {reg} register until `q` is typed in normal mode
@{reg}      Run the operations in {reg}
@@          Repeat: The last @{reg}
```

### Commands start with 'Z' and 'z'

```
ZZ          Save and close the current window
ZQ          Close and quit vim without saving
zc          Create a fold
```

### Commands start with 'g'

Part of the commands have been listed.

```
ge/gE       Word-level movement: Backward to the end of the word/WORD
{count}g_   Line-level movement: Downward {count}-1 lines, on the last non-blank character
gg          Document-level movement: The first character
```
### Mark

```
m{A-Za-z}   Set mark
`/'         Jump to the mark
```

### Window 

```
<C-w>s/v        Horizontal/Vertical split
<C-w>w          Switch
<C-w>h/j/k/l    Move left/down/up/right
<C-w>q          Quit

```

### Customization

```
\               It is the default value of <Leader>
<Alt>           It can be used for customization
<Tab>           It can be used for autocompletion
```

## Visual Mode

Most edit commands in normal mode are the same as in the visual mode, but part of them have slightly difference.

```
v               Enter visual mode from normal mode.
d/y             Character-level edit: Delete (Cut) / Yank
c               Character-level edit: Delete (Cut/Change) and enter insert mode
<               Line-level edit: Shift left
>               Line-level edit: Shift right
```

```
V               Enter linesise-visual mode from normal mode.
d/y             Line-level edit: Delete (Cut) / Yank
c               Line-level edit: Delete (Cut/Change) and enter insert mode
<               Line-level edit: Shift left
>               Line-level edit: Shift right
```

## Insert Mode

```
A/a             Enter insert mode and append at the end of the line/cursor
I/i             Enter insert mode and insert at the beginning of the line/cursor
O/o             Enter insert mode and insert a new line above/below the current line
```

Most commands in insert mode uses CTRL at first.

## Command-Line Mode

Command-line mode can be entered from normal mode by typing `:`, `/`, `?`, `!`.
The above commands are related to command-line mode, while part of them works in normal mode.

```
:{command}      Run {command} (Enter command-line mode)
Q               Enter Ex mode
```

### Search

```
%               Line-level search: Forward to the `{[(` and jump to its match
/{pattern}      Document-level search: Forward for {pattern}
?{pattern}      Document-level search: Backward for {pattern}
n/N             Repeat: '/' or '?' in the same/opposite direction
*/#             Document-level search: Forward/Backward for the next word under the cursor
```

### Substitute
The substitute command is `:[range]s[ubstitute]/{pattern}/{string}/[flags] [count]`.
It has one repeat single-character command in normal mode.
```
&               Repeat: The last substitute
```

### Filter

```
!/=             Filter text through an external program 
```
