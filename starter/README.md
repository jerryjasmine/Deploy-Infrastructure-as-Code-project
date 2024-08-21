# CD12352 - Infrastructure as Code Project Solution
# Abinaya

## Spin up instructions
./main.sh create us-east-1 AbinayaUdacityNetWork network.yml network-parameters.json
./main.sh create us-east-1 AbinayaUdacityApp udagram.yml udagram-parameters.json

## Tear down instructions
Empty the s3 bucket
./main.sh delete us-east-1 AbinayaUdacityApp
./main.sh delete us-east-1 AbinayaUdacityNetwork

## Other considerations
- I have added the Infrastructure diagram - Infra_diagram.png
- Templates are network.yml, udagram.yml
- Parameter files are - network-parameters.json, udagram-parameters.json
- I have deployed a static content(index.html) using cloudfront - http://d2m24dxi9g1jf5.cloudfront.net/
- Load Balancer Public URL - http://abinay-webap-bnyndlkeiv8y-1536454616.us-east-1.elb.amazonaws.com/
