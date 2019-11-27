#!/usr/bin/env groovy

@Library('buildHelper') _

pipeline {
    agent { dockerfile true }

    stages {
        stage('Pre-build cleanup') {
            when {
                branch 'PR-*'
            }
            steps {
                echo "Current build display name set to: ${currentBuild.displayName}"
                script {
                    currentBuild.displayName = "# ${env.BUILD_NUMBER} - ${env.CHANGE_TITLE}"
                    meUtils.removeDuplicates(currentBuild)
                }
            }
        }

        stage('Build') {
            when {
                branch 'PR-*'
            }
            steps {
                sh 'npm i'
                sh 'npm run prestart'
                sh 'npm run build:prod'
            }
        }

        stage('QA') {
            when {
                branch 'PR-*'
            }
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
