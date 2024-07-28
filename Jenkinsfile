pipeline { 

    environment { 

        registry = "harbinman/nodetest" 

        docker_id = credentials("dockerhub")

        dockerImage = ''
    }

    agent any 

    stages { 

        stage('Cloning our Git') { 

            steps { 

               checkout scm
            }
        } 

        stage('Building our image') { 

            steps { 

               sh "docker build  -t ${registry}:${env.BUILD_NUMBER} ."
            }
        }

        stage('Deploy our image') { 

            steps { 
                sh "echo ${docker_id_PSW} | docker login --username docker_id.USR --password-stdin"
                sh "docker image push ${registry}:${env.BUILD_NUMBER}  ${registry}:${env.BUILD_NUMBER}"
            }
        } 

        stage('Cleaning up') { 

            steps { 

                sh "docker rmi ${registry}:${env.BUILD_NUMBER}"
            }
        }
    }
}
