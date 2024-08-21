if [[ $1 != "deploy" && $1 != "delete" && $1 != "preview" && $1 != "create" && $1 != "update" ]]; then
    echo "ERROR: Incorrect execution mode. Valid values: deploy, delete, preview, create, update." >&2
    exit 1
fi

EXECUTION_MODE=$1
REGION=$2
STACK_NAME=$3
TEMPLATE_FILE_NAME=$4
PARAMETERS_FILE_NAME=$5

# Execute CloudFormation CLI
#abinayaIACProjectApp
if [ $EXECUTION_MODE == "deploy" ]
then
    aws cloudformation deploy \
        --stack-name $STACK_NAME \
        --template-file file://$TEMPLATE_FILE_NAME \
        --parameter-overrides file://$PARAMETERS_FILE_NAME \
        --capabilities "CAPABILITY_NAMED_IAM"  \
        --region=$REGION
fi
if [ $EXECUTION_MODE == "delete" ]
then
    aws cloudformation delete-stack \
        --stack-name $STACK_NAME \
        --region=$REGION
fi
if [ $EXECUTION_MODE == "preview" ]
then
    aws cloudformation deploy \
        --stack-name $STACK_NAME \
        --template-file file://$TEMPLATE_FILE_NAME \
        --parameter-overrides file://$PARAMETERS_FILE_NAME \
        --capabilities "CAPABILITY_NAMED_IAM"  \
        --no-execute-changeset \
        --region=$REGION
fi
if [ $EXECUTION_MODE == "create" ]
then
    aws cloudformation create-stack \
        --stack-name $STACK_NAME \
        --template-body file://$TEMPLATE_FILE_NAME \
        --parameters file://$PARAMETERS_FILE_NAME \
        --capabilities "CAPABILITY_NAMED_IAM"  \
        --region=$REGION
fi
if [ $EXECUTION_MODE == "update" ]
then
    aws cloudformation update-stack \
        --stack-name $STACK_NAME \
        --template-body file://$TEMPLATE_FILE_NAME \
        --parameters file://$PARAMETERS_FILE_NAME \
        --capabilities "CAPABILITY_NAMED_IAM"  \
        --region=$REGION 
fi
