pipeline {
    agent { dockerfile true }
    stages {
        stage('Test') {
          environment {HOME = '.'}
            steps {
                sh 'node --version'                
                sh "npm i"
                sh 'npm test'
            }
        }
    }
}
