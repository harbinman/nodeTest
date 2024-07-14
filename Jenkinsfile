pipeline {
    agent any
    stages { 




        stage('build docker image') {
            steps {
                withCredentials([usernamePassword(credentialsId: '0f18e7d0-2585-48af-843b-91a1fd3c7fde', passwordVariable: 'd_y&a666NuaAx6@', usernameVariable: 'harbinman')]) 
                {
                
                echo 'build docker image...'
                docker login -u ${usernameVariable} -p ${passwordVariable}
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