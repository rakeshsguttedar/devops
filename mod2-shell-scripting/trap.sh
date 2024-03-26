#!/bin/bash

# Third type of error handling using trap.
# This script handles signal using trap and executes the
# cleanup code upon receiving the signal

cleanup() {
    echo "Received INTERRUPT signal Control-c"
    echo "Cleaning up..."
    # Additional cleanup steps can be added here
    exit 1
}

# trap will call cleanup code after it receives 
# an INTERRUPT signal (Control-c)
trap cleanup INT

echo "Running..."
# wait for 5 seconds to simulate some actions
sleep 5
# echo $? # not needd

# Another way of handling error using ERR signal
trap 'catch $? $LINENO' ERR
catch() {
  echo "catching.."
  echo "caught error from ERR signal"
  echo "Error $1 occurred on $2"
}
echo "Before bad command"
badcommand # Error occurs here, this raises ERR signal
echo "After bad command"
