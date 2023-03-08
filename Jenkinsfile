pipeline {
    agent any
    tools{
        maven 'maven'
    }
    stages{
        stage('Build Maven'){
            steps{
                checkout([$class: 'GitSCM', branches: [ [name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/samandarjon/jenkinks-demo.git']]])
                bat 'mvn clean install'
            }
        }
        stage('Build docker image'){
            steps{
                script{
                    bat 'docker build -t com.epam/jenkins-demo .'
                }
            }
        }

        stage('Deploy to k8s'){
            steps{
                script{
                    bat "kubectl apply -f ./deployment.yaml"
                }
            }
        }
    }
}