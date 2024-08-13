# Shell Scripting

## Questions
1. `Advanced Variable Operations <br />
   a. echo "${NAME:-Shehab}" <br />
   If variable is empty,Will fill with Shehab. Otherwise, we still as the same. This usage provides a way to use a       default value without modifying the original variable and store into. Otherwise, we still as the same.<br />    
   b. `echo "${NAME:=Hazem}" :` <br />
   If variable is undefined, Will define and store into. Otherwise, we still as the same.<br />   
   c. `echo "${NAME:?Hazem}" :` <br />
   To raise an error if the variable is not declared.<br /> <br />
   
2. Advanced string Operations<br />
   a. check string [-n,-z] <br />
   b. Sub-string operation<br />
   c. Matching Patterns <br /> 
     + Searching pattern inside string. <br /> 
     + Extract <br /> <br />
        + Extract from the beg. <br /> 
        + Extract from the end. <br /> 
   d. Trim <br /> <br />
   
3. Flow Control <br /> 
   a. if else (Done in session 6)  <br />
   b. Loops <br /> 
     + for <br /> 
     + while <br /> 
   c. case (Done in session 6) <br /> 
   d. select <br /> <br />
   
5. Processing files <br /> 
   a. using while loop <br />
   b. using for loop <br />
   c. write on <br />
   d. extract information file. <br />
   e. source files. <br /> <br />
   
6. Debugging <br /> 
   a. error handling (terminate script on any command failure) <br /> 
   b. error on undefined variables (terminate script if an undefined variable is accessed) set -u <br /> 
   c. tracing (print each command before executing it) <br /> <br />
   
7. Functions <br />
   a. define and call function with arguments <br />
   b. Scopes Variables. <br />
   c. Return Values. <br /> <br />
   
8. Special Syntex. <br /> <br />

