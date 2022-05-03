createKafkaTopic () {
    $KAFKA_HOME/bin/kafka-topics.sh --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --topic $1
}

listenToKafka () {
    $KAFKA_HOME/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic $1 --from-beginning
}

addToKafka () {
    $KAFKA_HOME/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic $1
}

startKafka () {
    docker-compose --project-directory ~/dotfiles/kafka/ up -d
}

stopKafka () {
    docker-compose --project-directory ~/dotfiles/kafka/ down
}
