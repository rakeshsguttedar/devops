#!/bin/bash

global_var="global variable"

func_scope() {
  local local_var="local variable"
  echo "Inside the function: $FUNCNAME, Local: $local_var"
}

func_scope

echo "Outside the function, Global: $global_var"
# the local variable is not printed as it is outside the scope
echo "Outside the function, Local: $local_var" 

