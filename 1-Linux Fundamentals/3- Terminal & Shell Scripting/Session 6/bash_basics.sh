#!/usr/bin/bash

####################################### 1. Inputs ############################################
# We can make this inputs by two cases 
# 1.a Before run script
for((i=0;i<4;i++)); do
    echo "${!i}"
done

# access variables
first_name=$1
last_name=$2
echo "Hello, $first_name $last_name!"

# 1.b  After run operation "During run-time"
echo "Enter your first name and last name:" # Prompt the user for input
read -r first_name last_name

# Use the input (access variables)
echo "Hello, $first_name $last_name!"

echo "-----------------------------------------------------------------------------------"
####################################### 1. Operations ############################################
# 2.A.a and 2.A.c       Declare variable - Access Variable    (On Local Variables)
declare Name="Shehab Aldeen Mohammed"
echo "My name : $Name"

# 2.A.b Assign value variable
declare -i Value=5
Value=10                  # direct value
echo "$Value"


# 2.A.d Delete Variable
unset Value
echo "$Value"

echo "-----------------------------------------------------------------------------------"
##########################################################################################

# B. Functions 
## Assign value from another command. where hostname is a command call that print your name
declare NAME="hostname"   
echo ${NAME}

## specific commands
file_list=$(ls)           
echo "Files in the directory are: $file_list"

## command call
pstree                     

## each runing command return status of this call by ($?)
# which 0 ----> sucess or !0 ----> failed
if [ $? = 0 ]; then
    echo "Sucess"
else
    echo "Failed"
fi

echo "-----------------------------------------------------------------------------------"
##########################################################################################
# C. arithimitic operations
a=5      # Declare variables
b=3      # Declare variables

sum=$((a + b))               # Arithmetic operations
difference=$((a - b))
product=$((a * b))
quotient=$((a / b))
remainder=$((a % b))

echo "Sum: $sum"            # Output results
echo "Difference: $difference"
echo "Product: $product"
echo "Quotient: $quotient"
echo "Remainder: $remainder"


echo "-----------------------------------------------------------------------------------"
##########################################################################################

# D. Check Conditions
## D.a Checking if a File Exists
file="/home/shehabaldeen/Desktop/Linux/Hazem Khaled/Bullet-Guru/1-Linux Fundamentals/3- Terminal & Shell Scripting/Session 6"

if [ -e "$file" ]; then
    echo "File exists."
else
    echo "File does not exist."
fi

# D.b. Checking if a Variable is Empty 
var=""

if [ -z "$var" ]; then
    echo "Variable is empty."
else
    echo "Variable is not empty."
fi

# D.c. Checking if a String Equals Another String
str1="hello"
str2="world"

if [ "$str1" = "$str2" ]; then
    echo "Strings are equal."
else
    echo "Strings are not equal."
fi



# D.d. Checking Numeric Conditions
num1=10
num2=20

if [ "$num1" -lt "$num2" ]; then               # -lt:- lower than, -gt greater than.
    echo "$num1 is less than $num2."
else
    echo "$num1 is not less than $num2."
fi

# D.e.   switch case
day="Shehab"

case "$day" in
    "Monday")
        echo "It's Monday."
        ;;
    "Tuesday")
        echo "It's Tuesday."
        ;;
    "Wednesday"|"Thursday"|"Friday")
        echo "It's a weekday."
        ;;
    "Saturday"|"Sunday")
        echo "It's a weekend."
        ;;
    *)
        echo "Unknown day."
        ;;
esac

####################################### Env variable.##################################
## 1. Declare env variable.
declare -x ENV_NAME="Name"

## 2. Assign value variable.
ENV_NAME="Name1"

## 3. Access Variable.
echo ${ENV_NAME}

## 4. Delete Variable.
unset ENV_NAME

## 5. Print all ENV system.
env 

##########################################################################################
## clear our screen after testing 
sleep 8  # Delay for 8 seconds
clear
