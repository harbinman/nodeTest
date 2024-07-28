pipeline { 

    environment { 

        registry = "harbinman/nodetest" 

        registryCredential = 'dockerhub' 

        dockerImage = ''
    }

    agent any 

    stages { 

        stage('Cloning our Git') { 

            steps { 

               sh "echo  second  job"
            }
        } 

        stage('Building our image') { 

            steps { 

                script { 

                    dockerImage = docker.build registry + ":$build_num"
                }
            }
        }

        stage('Deploy our image') { 

            steps { 

                script { 

                    docker.withRegistry( '', registryCredential ) { 

                        dockerImage.push()
                    }
                }
            }
        } 

        stage('Cleaning up') { 

            steps { 

                sh "docker rmi $registry:$build_num"
            }
        }
    }
}
