pipeline {
      
    agent any
    stages {
        stage('Build') {
            steps {
                echo "========Starting the build========"
                sh "docker --version"
            }
        }
    }


    // stages {
    //     stage ('Build') {
    //         steps {
    //             echo "========Starting the build========"
    //             sh "docker build --pull --rm -f Dockerfile -t brewstaticserver:${env.BUILD_ID} ."
    //         }
    //         post{
    //             always {
    //                 echo "========always========"
    //             }
    //             success {
    //                 echo "========Build executed successfully========"
    //             }
    //             failure{
    //                 echo "========A execution failed========"
    //             }
    //         }
    //     }

    //     stage ('Deploy') {
    //       steps {
    //         sh "docker run -d -p 8989:80 brewstaticserver:${env.BUILD_ID}"
    //       }
    //     }
    // }
}
