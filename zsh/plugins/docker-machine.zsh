if [ -n "$DOCKER_MACHINE_DEFAULT" ]; then
    eval $(docker-machine env $DOCKER_MACHINE_DEFAULT)
fi
