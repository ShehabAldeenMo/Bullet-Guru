#! /usr/bin/bash


############################### Advanced Variable Operations. ###############################
NAME="Shehab"

echo "${NAME:-Hazem}"  # variable is empty        ---> NAME="Hazem" (* YOCTO)
echo "${NAME:=Hazem}"  # variable is not defined  ---> 1. define variable. then 2. set variable = value  (* YOCTO)
#echo "${NAME2:?Hazem}" # variable is not declared ---> raise error.




################################ Advanced string Operations. ################################
# 1. check string  ---> empty, declared, string1 = string2 (DONE in previous session)
##  -n to check if is not empty
unset NAME

if [ -n "$NAME" ]; then
    echo "NAME is declared and not empty: $NAME"
else
    echo "NAME is not declared or empty"
fi

##  -z to check if is empty
if [ -z "$NAME" ]; then
    echo "NAME is not declared or empty"
else
    echo "NAME is declared and not empty: $NAME"
fi

#----------------------------------------------------------------------------------------#

# 2. Sub-string operation.
declare string="Hello world"
echo "${string:3}"       # cutting operation : cut first 3 chars.
echo "${string:-3}"      # cutting operation : get last 3 chars.

#----------------------------------------------------------------------------------------#

# 3. Matching Pattern ---> 
## Searching pattern inside string.
declare data="Hello world"
if [[ "${data}" = *"Wold"* ]]; then
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


################################### Flow Control. ######################################
# if else Done before

# Loops 
### for
for i in `seq 10`;do  # we replaced `seq 10` with $(seq 10))
    echo "${i}"
done

#----------------------------------------------------------------------------------------#

## while 
index=1
end=10
while [ $index -le $end ]; do
    echo "${index}"
    ((index++))
done

#----------------------------------------------------------------------------------------#

## select loop
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

ls | while read -r filename; do
    echo "${filename}"
done

# ${#files[@]}: This is an expression that evaluates to the length of the array files. 
# Specifically, `#` is used to get the number of elements in the array, and files[@] refers to all elements of the files array.
# Loop over filenames using a wildcard (*) with a `while` loop
echo "Using wildcard and array:"
files=(*)
index=0
while [ $index -lt ${#files[@]} ]; do
    echo "${files[$index]}"
    ((index++))
done

#----------------------------------------------------------------------------------------#

for filename in `ls`; do # Backticks `` execute the command inside them and return the output. we can replace it with $(ls) better
    echo "${filename}"   # In this case, ls is executed, and the filenames are returned as a space-separated list.
done

for variable in *; do  # The * wildcard matches all files and directories in the current directory
    echo "${variable}" # echo "${variable}" prints each filename or directory name.
done

#----------------------------------------------------------------------------------------#

# 2.1: overwrite.
    echo "linux"  > "./test.txt" # overwrite.
# 2.2: Append
    echo "Windows" >> "./test.txt" # Append.

#----------------------------------------------------------------------------------------#

# 3. extract information file.
# 1. open file.
# 2. read file.
# 3. extract.

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









