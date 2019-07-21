#!/usr/bin/env bash

docker build --tag=jupyter .

nohup docker run -p 8888:8888 -v /Users/stevenpurcell/notebooks:/home/notebooks --restart unless-stopped jupyter &