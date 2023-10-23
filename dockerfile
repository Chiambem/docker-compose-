Creating a compose file> docker-compose.yml (start with version or service)
Chech validity of compose file by running docker-compose config
version: '3.8'
services:
  jenkins:
    image: jenkins/jenkins:lts
    ports:
      - 8080:8080
      - 50000:50000
    volumes:
      - jenkins_home:/var/jenkins_home
    deploy:
      mode: replicated
      replicas: 1
      restart_policy:
      condition: on-failure	
      placement:
        constraints:
          - node.role == manager
volumes:
  jenkins_home:
