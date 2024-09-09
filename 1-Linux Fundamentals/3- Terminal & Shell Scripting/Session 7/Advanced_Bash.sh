#! /usr/bin/bash


############################### 1. Advanced Variable Operations. ###############################
NAME="Shehab"

echo "${NAME:-shehab}"  # variable is empty        ---> NAME="shehab" (very important in YOCTO)
echo "${NAME2:=Hazem}"  # variable is not defined  ---> 1. define variable. then 2. set variable = value  (very important in YOCTO)
#echo "${NAME3:?Hazem}" # variable is not declared ---> raise error.




################################ 2. Advanced string Operations. ################################
# a. check string  ---> empty, declared, string1 = string2 (DONE in previous session)

unset NAME

##  -n to check if is not empty
if [ -n "$NAME" ]; then
    echo "NAME is declared and not empty: $NAME"
else
    echo "NAME is not declared or empty"
fi

Name=""

##  -z to check if is empty
if [ -z "$NAME" ]; then
    echo "NAME is not declared or empty"
else
    echo "NAME is declared and not empty: $NAME"
fi

#----------------------------------------------------------------------------------------#

# b. Sub-string operation.
declare string="Hello world"
echo "${string:  3}"       # Cutting operation : cut first 3 chars. Outputs: "lo world"
echo "${string: -3}"       # Getting operation : get last 3 chars.  Outputs: "rld"

#----------------------------------------------------------------------------------------#

# c. Matching Pattern ---> 

## Searching pattern inside string.
declare data="Hello Shehab"
if [[ "${data}" = *"World"* ]]; then
    echo "${data} contains: world"
else
    echo "Not Contain"
fi

#----------------------------------------------------------------------------------------#

## Extract
declare filename="Hello.txt"
# 2.1.1: Extract from the beg.
    # basic name:-
    declare basic_name=${filename%.*}
    echo "${basic_name}"
# 2.1.2: Extract from the end.
    # extension:- 
    declare extension=${filename##*.}
    echo "${extension}"

#----------------------------------------------------------------------------------------#

## d. Trim : be care that spaces between words will discard also.
declare string="       Hello world  " 
echo "Before trim: ${string}"
trimmed=$(echo -e "${string}" | tr -d '[:space:]')
echo "$trimmed"

################################### 3. Flow Control. ######################################
# a. if else Done before

# b. Loops 
### for
echo "for loop"
for i in `seq 10`;do  # we replaced `seq 10` with $(seq 10))
    echo "${i}"
done

## while 
echo "while loop"
index=1
end=10
while [ $index -le $end ]; do
    echo "${index}"
    ((index++))
done
#----------------------------------------------------------------------------------------#

# c. case (Done in session 6)

#----------------------------------------------------------------------------------------#

# d. select loop (set options to you and ask you to enter some one from it and loop til you enter suitable input)
select os in "linux" "windows"; do
    if [[ "${os}" == "linux" ]]; then
        echo "Linux operations"
        break
    elif [[ "${os}" == "windows" ]]; then
        echo "Windows operations"
        break
    else
        echo "Invalid selection"
    fi
done

###################################### Processing Files #####################################

# ${#files[@]}: This is an expression that evaluates to the length of the array files. 
# Specifically, `#` is used to get the number of elements in the array, and files[@] refers to all elements of the files array.
# Loop over filenames using a wildcard (*) with a `while` loop

# a. using while loop
echo "Using wildcard and array:"
files=(*)
index=0
while [ $index -lt ${#files[@]} ]; do
    echo "${files[$index]}"
    ((index++))
done

# or

ls | while read -r filename; do
    echo "${filename}"
done

#----------------------------------------------------------------------------------------#

# b. using for loop
for filename in `ls`; do # Backticks `` execute the command inside them and return the output. we can replace it with $(ls) better
    echo "${filename}"   # In this case, ls is executed, and the filenames are returned as a space-separated list.
done

for variable in *; do  # The * wildcard matches all files and directories in the current directory
    echo "${variable}" # echo "${variable}" prints each filename or directory name.
done

#----------------------------------------------------------------------------------------#

# c. write on 
## 2.1: overwrite.
    echo "linux"  > "./test.txt" # overwrite.
## 2.2: Append
    echo "Windows" >> "./test.txt" # Append.

#----------------------------------------------------------------------------------------#

# d. extract information file.
## 1. open file.
## 2. read file.
## 3. extract.

# Check if the file is provided as an argument
if [ -z "$1" ]; then
    echo "Usage: $0 filename"
    exit 1
fi

# Open and read the file line by line
while IFS= read -r line; do
    # Extract OS value for each user
    os=${line%:*}
    echo "${os}"
done < "$1"

# e. source files 
source ./tracing_functions.sh

trace_on
for i in `seq 10`;do  # we replaced `seq 10` with $(seq 10))
    echo "${i}"
done
trace_off

####################################### Debugging ###########################################
#    a. error handling (terminate script on any command failure)
#    b. error on undefined variables (terminate script if an undefined variable is accessed) set -u
#    c. tracing (print each command before executing it)

set -e # Activate error handling (terminate script on any command failure)
set -x # Activate tracing (print each command before executing it)
set -u # Activate error on undefined variables (terminate script if an undefined variable is accessed)

echo "-------- Debugging ----------"

# This command is undefined and will raise an error
# shehab             ### Note: I comment it to test the next lines because code termoinate with error (-e) 

echo "Right Command 1...... "
echo "Right Command 2...... "

set +e # Deactivate error handling for demonstration purposes

echo "Right Command 3  ...... "

display "Right Command 4   ...... " # This is a typo and will raise an error if set -e is active

echo "Right Command 5  ...... "

set +x # Deactivate tracing

set +u # Deactivate error on undefined variables


################################## Functions ##################################333
# a. define and call function with arguments
function name () {
    echo "Hello from 01_Function_testing.sh" # Function body
    echo "First argument: $1"
    echo "Second argument: $2"
    echo "Number of arguments: $#"
}

# Call the function with arguments
name "Shehab aldeen" "Yarab"

#----------------------------------------------------------------------------------------#

# b. Scopes Variables.
## Global variable
declare NAME="Terminal Scope"
echo "Before function call: ${NAME}"

# Function to change the value of NAME
function changeName(){
    # Uncomment the following line to see the effect of a local variable
    # local NAME="Function scope"

    # Changing the global variable NAME
    NAME="Function scope"
}

# Call the function
changeName

# Check the value of NAME after the function call
echo "After function call: ${NAME}"

#----------------------------------------------------------------------------------------#

# c. Return Values 
# Function that returns a number
function returnNumber()
{   
    return 10  # Returns 10 as the function's exit status (not as a value)
}

# Call the function and capture the return status
returnNumber
echo "Return status from returnNumber: $?"  # $? captures the exit status (10 in this case)


# Function that returns a string
function returnString()
{
    echo "Hello from return String"  # This is the actual output of the function
    return 20  # The exit status of the function and exit if see this line
    # echo "Hello from return String"  # This is the actual output of the function
}

# Capture the string returned by returnString
RET=$(returnString)  # Command substitution to capture the output of the function
echo "Return status from returnString: $?"  # This captures the exit status (20)
echo "String returned by returnString: ${RET}"

########################################### Special syntax #################################

# 1. Pipe (|) ---> syntax: command1 | command2
# Example: Passing the output of one command as input to another. 
echo "Testing .. " | grep "Test"

# 2. && ---> Syntax: command1 && command2
# Example: Executes command2 if and only if command1 is successful.
mkdir testing && cd testing

# 3. || ---> Syntax: command1 || command2
# Example: Executes command2 if and only if command1 fails.
cd testing || mkdir testing

# 4. ; ---> Syntax: command1 ; command2 ; command3
# Example: Runs all commands sequentially, regardless of success or failure.
echo "Print #1" ; echo "Print #2" ;

