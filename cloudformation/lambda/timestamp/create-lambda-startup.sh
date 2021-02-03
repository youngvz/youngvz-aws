# Create a python 3.6 lambda and have a a Cloudwatch rule trigger it every 10 minutes.
# The lambda should just create a new file with a timestamp-ed name in the s3 bucket

# export AWS_PROFILE=youngvz

# create cloudformation stack

# aws cloudformation create-stack --stack-name timestamp-lambda-stack \
#   --template-body file://create-timestamp-lambda-template.json \
#   --capabilities CAPABILITY_NAMED_IAM 

# list cloudformation stack

# aws cloudformation list-stacks \
#   --query 'StackSummaries[*].[StackName, StackStatus]' \
#   --stack-status-filter CREATE_IN_PROGRESS CREATE_COMPLETE \
#   --output table

# invoke lambda

# aws lambda invoke \
# --invocation-type RequestResponse \
# --function-name TimestampLambdaFunction \
# --log-type Tail outputfile.txt;  more outputfile.txt

# delete cloudformation stack

# aws cloudformation delete-stack --stack-name timestamp-lambda-stack

zip index.zip index.py
aws s3 cp ./index.zip s3://youngvz-python-code/timestamp-lambda/index.zip
rm -rf index.zip