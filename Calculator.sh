#!/bin/bash

echo "Please enter the first number:"
read num1

# Check if num1 is numeric
if ! [[ "$num1" =~ ^[0-9]+$ ]]; then
    echo "Error: '$num1' is not a valid number."
    exit 1
fi

echo "Please enter the second number:"
read num2

# Check if num2 is numeric
if ! [[ "$num2" =~ ^[0-9]+$ ]]; then
    echo "Error: '$num2' is not a valid number."
    exit 1
fi

echo "Please enter the operation (+, -, *, /):"
read op

# Check if op is a valid operation
if ! [[ "$op" =~ ^[-+*/]$ ]]; then
    echo "Error: '$op' is not a valid operation."
    exit 1
fi

if [ "$op" == "+" ]; then
    result=$((num1 + num2))
elif [ "$op" == "-" ]; then
    result=$((num1 - num2))
elif [ "$op" == "*" ]; then
    result=$((num1 * num2))
elif [ "$op" == "/" ]; then
    # Check if dividing by zero
    if [ "$num2" -eq 0 ]; then
        echo "Error: Cannot divide by zero."
        exit 1
    fi
    result=$((num1 / num2))
fi

echo "The result is: $result"
