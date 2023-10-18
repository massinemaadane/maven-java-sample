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
                withEnv(['JENKINS_NODE_COOKIE=dontKillMe']){
                bat 'java -jar -Dserver.port=8003 target/Spring-app.jar'
            }}
         }
    }
}
