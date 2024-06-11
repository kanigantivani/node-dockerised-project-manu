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
                withCredentials([usernamePassword(credentialsId: 'vaniuser-docker', passwordVariable: 'DOCKERHUB_PASSWORD', usernameVariable: 'DOCKERHUB_USERNAME')]) {
                    sh 'docker login -u $vaniuser -p $dcr_pat_ScH5BMxFhh2ndmDd1-H9Q6iquxc'
                    sh 'docker tag my-node-app:1.0 vaniuser/my-node-app:1.0'
                    sh 'docker push vaniuser/my-node-app:1.0'
                    sh 'docker logout'
                }
            }
        }
    }
}

        
    

