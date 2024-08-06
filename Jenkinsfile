pipeline {
    agent any
    environment {

                scannerHome = tool 'SonarQubeScanner'
                DOCKER_REGISTRY = 'http://nexus.winters-tek.net:8083/'
                DOCKER_CREDENTIALS_ID = 'nexus-user' // 在 Jenkins 中配置的 Docker 凭证的 ID
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
                   
                      sh '''
                            /opt/sonar-scanner/bin/sonar-scanner \
                            -Dsonar.projectKey=nodeproject \
                            -Dsonar.sources=. \
                            -Dsonar.host.url=http://jenkins.winters-tek.net:9001 \
                            -Dsonar.login=sqp_e17057f59f51fcf86db851c8aff12b8e0bcd3096
                    '''
                    }
                
                  
               
            }
        
         stage('upload docker registry') {
            steps {
                 script {
                   withCredentials([usernamePassword(credentialsId: DOCKER_CREDENTIALS_ID, passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                     sh '''
                        echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin $DOCKER_REGISTRY
                        docker build  -t nodetest .
                        docker tag nodetest nexus.winters-tek.net:8083/nodetest:$BUILD_NUMBER
                        docker push nexus.winters-tek.net:8083/nodetest:$BUILD_NUMBER
                        '''
                   }
                 }
                }
            }
        }
    }

