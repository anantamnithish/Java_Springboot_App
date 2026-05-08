pipeline {
    agent any

    tools {
        jdk 'jdk17'
        maven 'M3'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build & Test') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'mvn clean test'
                    } else {
                        bat 'mvn.cmd clean test'
                    }
                }
            }
        }

        stage('Archive') {
            steps {
                archiveArtifacts artifacts: 'target/*.jar', allowEmptyArchive: true
                junit 'target/surefire-reports/*.xml'
            }
        }
    }

    post {
        always {
            script {
                if (isUnix()) {
                    sh 'pwd'
                } else {
                    bat 'cd'
                }
            }
        }
        success {
            echo 'Build succeeded.'
        }
        failure {
            echo 'Build failed. Check the test results and console output.'
        }
    }
}
