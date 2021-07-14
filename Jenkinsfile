pipeline {
    agent any
    // tools{
    //   jdk 'localJDK'
    //   maven 'localMaven'
    // }
    stages {
        stage ('Build') {
            steps {
                echo "========Starting the build========"
                // sh "/Applications/Docker.app/Contents/Resources/bin/docker build . -t tomcatwebapp:${env.BUILD_ID}"
                // sh "/Applications/Docker.app/Contents/Resources/bin/docker build --pull --rm -f Dockerfile -t brewstatic ."
                sh "/Applications/Docker.app/Contents/Resources/bin/docker build --pull --rm -f Dockerfile -t brewstaticserver:${env.BUILD_ID} ."
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

            sh "/Applications/Docker.app/Contents/Resources/bin/docker run -d -p 8989:80 brewstaticserver:${env.BUILD_ID}"
          }
        }
    }
}
