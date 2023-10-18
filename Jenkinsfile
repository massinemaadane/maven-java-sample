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
         stage('deploy') {
            steps {
               bat 'docker build -t spring-app .'
            }
         }
    }
}
