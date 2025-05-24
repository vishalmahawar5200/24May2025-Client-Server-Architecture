pipeline {
    agent any
    environment{
        DOCKER_IMAGE = "vishalmahawar5200/24may2025"
    }

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

        stage('Build Docker Image'){
            steps{
                script{
                    def imageTag = "v${env.BUILD_NUMBER}"
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-repo', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                        sh "docker build -t ${DOCKER_IMAGE}:${imageTag} ."
                        sh "echo $PASS | docker login -u $USER --passwordstdin"
                    }
                }
            }
        }

        stage('Push Docker Image'){
            steps{
                script{
                    def imageTag = "v${env.BUILD_NUMBER}"
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-repo', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                        sh "docker tag ${DOCKER_IMAGE}:${imageTag} ${DOCKER_IMAGE}:${imageTag}"
                        sh "docker push ${DOCKER_IMAGE}:${imageTag}"
                    }
                }
            }
        }
    }
}