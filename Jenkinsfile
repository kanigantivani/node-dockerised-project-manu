pipeline {
    agent any
    stages{
        stage("checkout"){
            steps{
                checkout scm
            }
        }

        stage("Test"){
            steps{
                sh 'npm install'
                sh 'npm test'
            }
        }

        stage("Build"){
            steps{
                sh 'npm run build'
            }
        }

        stage("Build Image"){
            steps{
                sh 'docker build -t my-node-app:1.0 .'
            }
        } 
        stage('Docker Push') {
            steps {
                withDockerRegistry(credentialsId: 'vaniuser-docker', toolName: 'Docker', url: 'vaniuser') {
                    sh 'docker tag my-node-app:1.0 vaniuser/my-node-app:1.0:latest '
                    sh 'docker push vaniuser/my-node-app:1.0:latest'
                    sh 'docker logout'
                }
            }
        }
    }
}

        
    

