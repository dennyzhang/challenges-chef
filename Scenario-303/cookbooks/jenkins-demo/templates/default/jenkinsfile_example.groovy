#!/usr/bin/env groovy

node('master') {
    try {
        stage('build') {
            sh "echo todo"
        }

        stage('test') {
            sh "echo todo"
        }

        stage('deploy') {
            sh "echo todo"
        }
    } catch(error) {
        throw error
    } finally {
        // Any cleanup operations needed, whether we hit an error or not
    }
}