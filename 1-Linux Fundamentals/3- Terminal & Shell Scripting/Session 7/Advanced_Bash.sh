#! /usr/bin/bash


############################### Advanced string Operations. ###############################
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

# 2. Sub-string operation.
declare string="Hello world"
echo "${string:3}"       # cutting operation : cut first 3 chars.
echo "${string: -3}"     # cutting operation : get last 3 chars.

# 3. Matching Pattern ---> 
## Searching pattern inside string.
declare data="Hello world"
if [[ "${data}" = *"Wold"* ]]; then
    echo "${data} contains: world"
else
    echo "Not Contain"
fi

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