#!/bin/bash
# Creating the env variable
my_variable="There is some value here"

# Appling if condition with -z which is to check the string is empty or not

if [ -z "$my_variable" ]; then
	echo "There is some value in given variable"
else
	echo "There is no value in given variable"
fi

