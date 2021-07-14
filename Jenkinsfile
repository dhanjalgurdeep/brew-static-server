pipeline {
      
    agent any
    tools {
        'org.jenkinsci.plugins.docker.commons.tools.DockerTool' '18.09'
    }
    environment {
        DOCKER_CERT_PATH = credentials('id-for-a-docker-cred')
    }

    stages {
        stage ('Build') {
            steps {
                echo "========Starting the build========"
                // sh "/Applications/Docker.app/Contents/Resources/bin/docker build . -t tomcatwebapp:${env.BUILD_ID}"
                // sh "/Applications/Docker.app/Contents/Resources/bin/docker build --pull --rm -f Dockerfile -t brewstatic ."
                sh "docker-compose build --pull --rm -f Dockerfile -t brewstaticserver:${env.BUILD_ID} ."
            }
            post{
                always {
                    echo "========always========"
                }
                success {
                    echo "========Build executed successfully========"
                }
                failure{
                    echo "========A execution failed========"
                }
            }
        }

        stage ('Deploy') {
          steps {
            // sh "/Applications/Docker.app/Contents/Resources/bin/docker stop \$(/Applications/Docker.app/Contents/Resources/bin/docker ps -aq)"
            // sh "/Applications/Docker.app/Contents/Resources/bin/docker rm \$(/Applications/Docker.app/Contents/Resources/bin/docker ps -aq)"

            sh "docker-compose run -d -p 8989:80 brewstaticserver:${env.BUILD_ID}"
          }
        }
    }
}
