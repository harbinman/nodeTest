pipeline {
    agent any
    stages { 




        stage('build docker image') {
            steps {
                withCredentials([usernamePassword(credentialsId: '0f18e7d0-2585-48af-843b-91a1fd3c7fde', passwordVariable: 'password', usernameVariable: 'username')]) 
                {
                
                echo 'build docker image...'
                docker login -u $username -p $password
                docker build -t harbinman/nodetest .
                docker tag   harbinman/nodetest
                docker push harbinman/nodetest:${BUILD_ID}
 
                }
         
            }
        }
        stage('test image') {
            steps {
                echo 'test image...'

            }
        }
        stage('Example') {
            steps {
                echo 'Hello World'
            }
        }
        stage('Example') {
            steps {
                echo 'Hello World'
            }
        }
    }
}
