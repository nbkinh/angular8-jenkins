#!/usr/bin/env groovy

@Library('buildHelper') _

pipeline {
    agent { dockerfile true }
    environment {
            HOME = '.'
    }

    stages {
        stage('Pre-build cleanup') {
            steps {
                echo "Current build display name set to: ${currentBuild.displayName}"
                script {
                    currentBuild.displayName = "# ${env.BUILD_NUMBER} - ${env.CHANGE_TITLE}"
                    meUtils.removeDuplicates(currentBuild)
                }
            }
        }

        stage('Build') {
            steps {
                sh 'npm i'
            }
        }

        stage('QA') {
            parallel {
                stage('Code quality analysis') {
                    steps {
                        sh 'npm run lint'
                    }
                }

                stage('Tests') {
                    steps {
                        sh 'npm run test'
                    }
                    post {
                        always {
                            script {
                                junit 'test-results.xml'
                                meUtils.updateGithubCommitStatus(currentBuild, "Tests against ${CHANGE_TARGET}")
                            }
                        }
                    }
                }
            }
        }
    }

    post {
        always {
            deleteDir()
        }
    }
}
