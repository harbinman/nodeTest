pipeline {
    agent any

    stages {
        stage('git clone code') {
            steps {
                git branch: 'main', url: 'https://github.com/harbinman/nodeTest.git'
            }
        }
         stage('npm install') {
            steps {
                sh' npm i'
            }
        }
        stage('sonar scan') {
            steps {
              sh 
               """
                    sonar-scanner \
                        -Dsonar.projectKey=nodeproject \
                        -Dsonar.sources=. \
                        -Dsonar.host.url=http://jenkins.winters-tek.net:9001 \
                        -Dsonar.login=sqp_e17057f59f51fcf86db851c8aff12b8e0bcd3096

                """

            }
        }
    }
}
