pipeline {
    agent { dockerfile true }
    stages {
        stage('Test') {
          environment {HOME = '.'}
            steps {
                sh 'node --version'
                sh 'svn --version'
                sh "npm i"
                wrap([$class: 'Xvnc', takeScreenshot: false, useXauthority: true]) {
                    sh 'npm run test'
                }
            }
        }
    }
}
