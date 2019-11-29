pipeline {
    agent { dockerfile true }
    stages {
        stage('Test') {
          environment {HOME = '/var/www/html'}
            steps {
                sh 'node --version'
                sh 'svn --version'
                sh 'chown -R 127:134 /var/www/html/'
                sh "npm i"
                wrap([$class: 'Xvnc', takeScreenshot: false, useXauthority: true]) {
                    sh 'npm run test'
                }
            }
        }
    }
}
