#!/bin/bash

# Debugging: set -x is often used when you want to debug your script to see how variables are being expanded, 
# how loops are executed, and where potential issues might arise.
function trace_on(){
    set -x 
}

# This command disables debugging, stopping the trace of subsequent commands. 
function trace_off(){
    set +x 
}