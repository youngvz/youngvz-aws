# Cloud formation exercise #1: Create a s3 bucket
export AWS_PROFILE=youngvz
aws cloudformation deploy --template-file create-s3-template.yaml --stack-name youngvz-python-code