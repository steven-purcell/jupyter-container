#!/usr/bin/env bash

docker build --tag=jupyter .

docker run -p 8888:8888 -v /Users/stevenpurcell/notebooks:/home/notebooks --restart unless-stopped jupyter