#!/bin/bash
#
###################################################################
# Auther	: Abdul Khadeer
# Dept		: DevOps
# Date		: 02-03-2024
#
# Description	: To listout the resources and preparing the report
# Version	: version v1
###################################################################
# Checking the s3 resources/buckts
echo "Print list of s3:"
aws s3 ls

# Listing ec2 instances 
echo "Print list of ec2-instances:"
aws ec2 describe-instances

# Listing lambda
echo "Print list of Lambda funcitons :"
aws lambda list-functions

# Listing IAM users
echo "Print list of IAM Users:"
aws iam list-users

