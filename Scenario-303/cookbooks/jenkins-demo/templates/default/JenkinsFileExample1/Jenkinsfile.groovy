#!/usr/bin/env groovy

node('master') {
    try {
        stage('build') {
            sh "echo dummy build action"
        }

        stage('test') {
            sh "echo dummy test action"
        }

        stage('deploy') {
            sh "echo dummy deploy action"
        }
    } catch(error) {
        throw error
    } finally {
        // Any cleanup operations needed, whether we hit an error or not
    }
}
