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
               bat 'docker build -t myspringapp.azurecr.io/spring-app .'
            }
         }
        stage('push image') {
            steps {
                script{
                    bat 'docker login myspringapp.azurecr.io -u MySpringApp -p d7PFOC6ICL4MtfximqmMSOTHeILLTLKJ0QdGAV3APp+ACRCpjMlV'
                    bat 'docker push myspringapp.azurecr.io/spring-app'
                }
            }
         }
       
    }
}
