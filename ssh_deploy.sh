#!/bin/bash

APP="${1}"
PORT_EXTERNAL="${2}"
PORT_INTERNAL="${3}"

echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin

docker build -t $DOCKER_USER/$DOCKER_PYTHON_APP ./python-app
docker push $DOCKER_USER/$DOCKER_PYTHON_APP

ssh $DEPLOY_HOST_USERNAME@$DEPLOY_HOST -p $DEPLOY_HOST_PORT docker pull $DOCKER_USER/$APP
ssh $DEPLOY_HOST_USERNAME@$DEPLOY_HOST -p $DEPLOY_HOST_PORT docker stop $APP || echo "failed to stop container"
ssh $DEPLOY_HOST_USERNAME@$DEPLOY_HOST -p $DEPLOY_HOST_PORT docker rm $APP || echo "failed to remove container"
ssh $DEPLOY_HOST_USERNAME@$DEPLOY_HOST -p $DEPLOY_HOST_PORT docker rmi $DOCKER_USER/$APP || echo "failed to remove image"
ssh $DEPLOY_HOST_USERNAME@$DEPLOY_HOST -p $DEPLOY_HOST_PORT docker run -d -p $PORT_EXTERNAL:$PORT_INTERNAL --name $APP $DOCKER_USER/$APP
