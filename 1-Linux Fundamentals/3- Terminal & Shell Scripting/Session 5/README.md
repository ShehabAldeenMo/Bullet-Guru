# Terminal Overview

## What is a Terminal?

A terminal, also known as a command-line interface (CLI), is a text-based interface used to interact with an operating system. It allows users to enter commands and receive text-based output, providing a powerful way to perform a wide range of tasks, including file manipulation, program execution, and system management.

## Examples in Session
+ How to create local variable ?
```
Name="Shehab"
echo $Name
```
local variable means that it defines for the current bash only. And we can't use it we its childern.

------------------------------------------------------------------------------------------------------------------

+ How to define global variable ?
```
export Name="ShehabAldeen"
```
global variable means that it defines for the current bash and its childern. 

> Note
> This is not a permanent variable so you need to define it each time that you want to use.

------------------------------------------------------------------------------------------------------------------

+ How can we test this sencerio ?
```
bash
```
try to access this variables and you will find what we mean.

------------------------------------------------------------------------------------------------------------------

+ how can we find the relations between these series ?
use `pstree` we will find
```
        │         ├─gnome-terminal-─┬─bash───bash───bash───pstree
        │         │                 └─4*[{gnome-terminal-}]
        │         ├─goa-daemon───3*[{goa-daemon}]
        │         ├─goa-identity-se───2*[{goa-identity-se}]
        │         ├─gsd-a11y-settin───3*[{gsd-a11y-settin}]

```

------------------------------------------------------------------------------------------------------------------

+ What are alias ?
alias is used to define local variable only. And we can use it to get the content of variables without `$` to use it.
```
alias Disk_Partition="df -h"
Disk_Partition
```
if we create any child from this bash we won't access Disk_Partition.

------------------------------------------------------------------------------------------------------------------

+ Very Important question, Why don't we use $ to use access local env variable ?
In Bash scripting, the `$` symbol is used to reference the value of a variable. This is necessary to distinguish between the variable name and its value. On the other hand, aliases do not require the $ symbol because they are simply command shortcuts and not variables.

```
Disk="df -h"
Disk
```
In This usage, Disk will not be resolved and bash will say `Disk: command not found` because there's no command with this name. Then, if we say, we will use `echo Disk`. That will print our text only without running it. What about we will use `$Disk`. In this case, Derefence Disk with `df -h` and print disk partitions as we want.

```
alias Disk_Partition="df -h"
Disk_Partition
```
we don't need to derefernce or something like this case. Becuase it is regarded as shortcut of command and run it directly.


------------------------------------------------------------------------------------------------------------------

+ How to append some path for env PATH to make bash search about we want in this path also.
```
PATH=$PATH:"/path/of/folder"
`or`
PATH="/path/of/folder":$PATH
```

------------------------------------------------------------------------------------------------------------------

+ what the difference between the previous sentances ?
Bash search sequentially in &PATH. When it find the want program, It will exit from searching algprithim and print run this file.


------------------------------------------------------------------------------------------------------------------

+ How delete some variable global or local that you created ?
```
unset Name
```
Try to reuse it. you will find nothing.

------------------------------------------------------------------------------------------------------------------

+ How to define variables permanent on files ?
By write this variable using alias or env in .bashrc. Now we will illustrate how to terminal run.
```
─── ─── ───                         ─── ─── ─── ─── ───                       ─── ─── ─── 
│ Terminal │                        │ Bashrc file     │                       │ sourcing   │
│ -------- │ -------loading-------> │ -------------   │ --------loading-----> │ some files │
│  + env   │                        │ + env | .bashrc │                       │ into bashrc│
─── ─── ───                         ─── ─── ─── ─── ───                        ─── ─── ─── 
```

After it the previous loading, Bash is ready to get any command from you and ask you if it is an external command will  search into `$PATH` then run it or built-in command.

So if we can define env or alias variable in bashrc or any file included into bashrc , we will be able to use it in any created bash.


------------------------------------------------------------------------------------------------------------------

+ How to edit in bashrc ?<br />
step(1): `vim ~/.bashrc` and make alias or env.<br />
step(2): `source ~/.bashrc` to read bashrc into runtime, if changed during runtime.<br />

now you can use any `shortcut` or defined variable with every new load of this file<br />





 
