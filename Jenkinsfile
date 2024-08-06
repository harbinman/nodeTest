pipeline {
    agent any
    environment {

                scannerHome = tool 'SonarQubeScanner'

     }
    tools {
        nodejs 'NodeJS' // 使用你在全局工具配置中设置的名称
        
    }
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
                    withCredentials([usernamePassword(credentialsId: '<credentials-id>', passwordVariable: 'password', usernameVariable: 'username')]) {
                      sh '''
                            docker login -u $username -p $password ...
                            /opt/sonar-scanner/bin/sonar-scanner \
                            -Dsonar.projectKey=nodeproject \
                            -Dsonar.sources=. \
                            -Dsonar.host.url=http://jenkins.winters-tek.net:9001 \
                            -Dsonar.login=sqp_e17057f59f51fcf86db851c8aff12b8e0bcd3096
                    '''
                    }
                
                  
               
            }
        }
         stage('upload docker registry') {
            steps {

                
                    sh '''
                        docker build  -t nodetest .
                        docker tag nodetest nexus.winters-tek.net:8083/nodetest:latest 
                        docker push nexus.winters-tek.net:8083/nodetest:latest
                    '''
               
            }
        }
    }
}
