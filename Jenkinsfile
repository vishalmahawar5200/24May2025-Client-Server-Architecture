pipeline {
    agent any
    stages{
        stage('Install Docker Dependencies'){
            steps{
                sh 'apt-get update  && apt-get upgrade -y && apt-get install -y docker.io'
            }
        }

        stage('Check Version'){
            steps{
                sh 'docker --version'
            }
        }
    }
}