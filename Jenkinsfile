pipeline {
    agent { dockerfile true }
    stages {
      stage('build') {
            steps {
                sh 'npm install'
            }
        }
        stage('Test') {
            steps {
                sh 'node --version'
                sh 'svn --version'
                sh 'npm test'
            }
        }
    }
}
