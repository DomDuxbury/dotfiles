createDockerNetwork () {
    docker network create flink-network
}

startJobManager () {
    docker run \
        --rm \
        --name=jobmanager \
        --network flink-network \
        --publish 8081:8081 \
        --env FLINK_PROPERTIES="${FLINK_PROPERTIES}" \
        pyflink jobmanager
}

startTaskManager () {
    docker run \
        --rm \
        --name=taskmanager \
        --network flink-network \
        --env FLINK_PROPERTIES="${FLINK_PROPERTIES}" \
        pyflink taskmanager
}
