
pipeline {
    agent any

    environment {
        DOCKER_CREDENTIALS_ID = '0f18e7d0-2585-48af-843b-91a1fd3c7fde'  // Jenkins 中的 Docker 凭据 ID
        DOCKER_IMAGE = 'nodetest'
        DOCKER_TAG = "${env.BUILD_ID}"
        DOCKER_REGISTRY = 'harbinman'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            steps {
                script {
                    // 构建 Docker 镜像
                    sh "docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} ."
                }
            }
        }
        stage('Push') {
            steps {
                script {
                    // 登录 Docker 注册表
                    withCredentials([usernamePassword(credentialsId: env.DOCKER_CREDENTIALS_ID, passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')]) {
                        sh "echo $PASSWORD | docker login -u $USERNAME --password-stdin ${DOCKER_REGISTRY}"
                    }
                    // 推送 Docker 镜像到注册表
                    sh "docker tag ${DOCKER_IMAGE}:${DOCKER_TAG} ${DOCKER_REGISTRY}/${DOCKER_IMAGE}:${DOCKER_TAG}"
                    sh "docker push ${DOCKER_REGISTRY}/${DOCKER_IMAGE}:${DOCKER_TAG}"
                }
            }
        }
    }
}
