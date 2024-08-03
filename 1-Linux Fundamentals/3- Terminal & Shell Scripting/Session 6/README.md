# Shell Scripting Overview

## What is Shell Scripting?

Shell scripting is a way to automate tasks and manage systems by writing a sequence of commands for the shell to execute. It is a powerful tool used in Unix-like operating systems to perform repetitive tasks, manage files and processes, and configure system settings.

## Key Features

- **Automation**: Automate repetitive tasks to save time and reduce errors.
- **Task Scheduling**: Schedule scripts to run at specific times using cron jobs.
- **System Management**: Manage files, processes, and system configurations.
- **Text Processing**: Manipulate text files and streams using tools like `awk`, `sed`, and `grep`.
- **Custom Tools**: Create custom command-line utilities to extend system functionality.

## Common Shells

- **Bash (Bourne Again Shell)**: The most commonly used shell in Linux distributions.
- **Sh (Bourne Shell)**: The original Unix shell.
- **Zsh (Z Shell)**: An extended shell with many features and customization options.
- **Ksh (Korn Shell)**: A shell with advanced scripting capabilities.

## Questions

+ What is the shebang ?<br />
The shebang (`#!`) in shell scripting is used to specify the interpreter that should be used to execute the script. When a script starts with a shebang, the operating system uses the specified interpreter to run the script. This ensures that the script is executed in the correct environment with the appropriate interpreter.

Examples :-<br />
1. `#!/bin/bash` to run into bash environment and use its syntex and definations.
2. `#!/usr/bin/env python3` to run into python environment and use its syntex and definations.

It allows you to run the script directly without specifying the interpreter manually each time. For example, instead of running a bash script with `bash script.sh` You can simply make the script executable and run it `./script.sh`.

------------------------------------------------------------------------------------------------------------------

+ If I tried to run it, why can't be runned ?<br />
Because you need to make it as executable using this command `chmod +x path/of/file/name.sh`

------------------------------------------------------------------------------------------------------------------
**Structure of Bash Scripting**<br />
+ Inputs
+ Operations
+ Outputs

------------------------------------------------------------------------------------------------------------------

1. Inputs<br />
  + At first: we will discuss about who could make these inputs (Developer, Script, Service Management).
  + Secondary: Types of inputs are (local-env-shell).
  + We can make this inputs by two cases : a. Before run script, b. After run operation "During run-time". We make an example on each case into `01_bash_basics.sh`
  + 1.a. Before run script (Positional Parameters):-
using shell input arguments as `$0  ---> name script` `$1  ---> 1st paramater` `$2  ---> 2nd parameter`
  
  + 1.b. After run operation (During run-time):-
hold input till user enter it using read.


------------------------------------------------------------------------------------------------------------------


2. Operations on variables (We make an example on each case into `01_bash_basics.sh`).<br />
   + A. On Local Variables
     + a. Declare variable `tldr declare` will show the types of variables that could be declared.
     + b. Assign value variable
     + c. Access Variable
     + d. Delete Variable

  + B. Functions
  + C. Aritimitic Operations
  + D. Check Conditions (use tldr test):- 
      + a. Checking if a File Exists
      + b. Checking if a Variable is Empty
      + c. Checking if a String Equals Another String
      + d. Checking Numeric Conditions
      + e. case

------------------------------------------------------------------------------------------------------------------

+ Enviroment variables could be accessed, assigned, deleted, print all env.

------------------------------------------------------------------------------------------------------------------

3. Outputs (In next Session)<br />
   + A. exit
   + B. print on screen by echo or printf




