#!/usr/bin/env bash

docker build --tag=jupyter .

if [ -f ~/.aws/credentials ];
then
    AWS_ACCESS_KEY_ID=$(aws --profile default configure get aws_access_key_id)
    AWS_SECRET_ACCESS_KEY=$(aws --profile default configure get aws_secret_access_key)

    docker run -p 8888:8888 -v /Users/stevenpurcell/ImageVolumes/Jupyter:/home --restart unless-stopped  \
    --env AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID --env AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
    jupyter &> output.log &
else
    docker run -p 8888:8888 -v /Users/stevenpurcell/ImageVolumes/Jupyter:/home --restart unless-stopped \
    jupyter &> output.log &
fi




