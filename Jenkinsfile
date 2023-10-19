pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
    }
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
                  bat 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USER --password-stdin'
                    bat 'docker push yassinemaadane/spring-app'
                }
            }
         }
    }
}
