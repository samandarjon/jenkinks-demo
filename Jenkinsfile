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

        stage('Run Docker image'){
            steps{
                script{
                    bat "docker stop com.epam/jenkins-demo"
                    bat "docker rm com.epam/jenkins-demo"
                    bat "docker run -p 8081:8081 com.epam/jenkins-demo -d"
                }
            }
        }
    }
}