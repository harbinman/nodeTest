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

               sh "docker build . -t registry + ":$env.BUILD_NUMBER""
            }
        }

        stage('Deploy our image') { 

            steps { 
                sh "docker login -u ${docker_id_USR} -p ${docker_id_PWD}"
                sh "docker image push registry:${env.BUILD_NUMBER}  registry:${env.BUILD_NUMBER}"
            }
        } 

        stage('Cleaning up') { 

            steps { 

                sh "docker rmi $registry:$build_num"
            }
        }
    }
}
