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
              
              echo myVar = $myName
            }
        }

        
    }
        

    
}
