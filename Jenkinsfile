
pipeline {
    agent any

    environment {
        DOCKER_CREDENTIALS_ID = 'bddfc23d-c18c-4ebf-89a9-4afa39dff7ef'  // Jenkins 中的 Docker 凭据 ID
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
                    // // 登录 Docker 注册表
                    // withCredentials([usernamePassword(credentialsId: env.DOCKER_CREDENTIALS_ID, passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')]) {
                    //     sh "docker login -u $USERNAME -p $PASSWORD"
                    // }
                    // 推送 Docker 镜像到注册表
                    sh "docker tag ${DOCKER_IMAGE}:${DOCKER_TAG} ${DOCKER_REGISTRY}/${DOCKER_IMAGE}:${DOCKER_TAG}"
                    sh "docker push ${DOCKER_REGISTRY}/${DOCKER_IMAGE}:${DOCKER_TAG}"
                }
            }
        }
    }
}
