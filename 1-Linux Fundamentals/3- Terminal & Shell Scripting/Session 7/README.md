# Shell Scripting

## Questions
1. `Advanced Variable Operations <br />
   a. echo "${NAME:-Shehab}" <br />
   If variable is empty,Will fill with Shehab. Otherwise, we still as the same. This usage provides a way to use a       default value without modifying the original variable and store into. Otherwise, we still as the same.<br /> <br />
   
   b. `echo "${NAME:=Hazem}" :` <br />
   If variable is undefined, Will define and store into. Otherwise, we still as the same.<br /> <br />
   
   c. `echo "${NAME:?Hazem}" :` <br />
   To raise an error if the variable is not declared.<br /> <br />
   
3. Advanced string Operations<br />
   a. check string [-n,-z] <br />
   b. Sub-string operation<br /> <br />
   c. Matching Patterns <br /> <br />
     + Searching pattern inside string. <br /> <br />
     + Extract <br /> <br />
        + Extract from the beg. <br /> <br />
        + Extract from the end. <br /> <br />
   d. Trim <br /> <br />
4. Flow Control <br /> <br />
   a. if else (Done in session 6)  <br /> <br />
   b. Loops <br /> <br />
     + for <br /> <br />
     + while <br /> <br />
   c. case (Done in session 6) <br /> <br />
   d. select <br /> <br />
5. Processing files <br /> <br />
   a. using while loop <br /> <br />
   b. using for loop <br />
   c. write on <br />
   d. extract information file. <br />
   e. source files. <br /> <br />
6. Debugging <br /> <br />
   a. error handling (terminate script on any command failure) <br /> <br />
   b. error on undefined variables (terminate script if an undefined variable is accessed) set -u <br /> <br />
   c. tracing (print each command before executing it) <br /> <br />
7. Functions <br /> <br />
   a. define and call function with arguments <br /> <br />
   b. Scopes Variables. <br /> <br />
   c. Return Values. <br /> <br />
8. Special Syntex. <br /> <br />

