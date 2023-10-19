pipeline {
    agent any

    stages {
         stage('build') {
            steps {
                bat 'mvn compile'
            }
        }
        stage('test') {
            steps {
                bat 'mvn test'
            }
        }
        stage('package') {
            steps {
                bat 'mvn package'
            }
            post {
    always {
        junit 'target/surefire-reports/*.xml'
  }
  success{
        archiveArtifacts artifacts: 'target/*.jar', followSymlinks: false
    }
}
            
        }
         stage('build image') {
            steps {
               bat 'docker build -t yassinemaadane/spring-app .'
            }
         }
        stage('push image') {
            steps {
                script{
                    withCredentials([string(credentialsId: 'dockerhubCred', variable: 'dockerhubCred')]) {
                    bat 'docker login -u YassineMaadane -p ${dockerhubCred}'
                    }
                    bat 'docker push yassinemaadane/spring-app'
                }
            }
         }
    }
}
