pipeline {
    agent { dockerfile true }
    stages {
        stage('Test') {
            steps {
                sh 'node --version'
                sh 'svn --version'
                sh 'cd /var/www/html'
                sh 'npm test'
            }
        }
    }
}
