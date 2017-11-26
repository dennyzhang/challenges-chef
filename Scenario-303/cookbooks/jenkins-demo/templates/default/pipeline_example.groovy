node {
    try {
        stage('Build') {
            echo 'Building..'
        }
        stage('Test') {
            build job: "CommonServerCheckRepo"
        }
        stage('Deploy') {
            echo 'Deploying....'
        }
    }
    finally {
        echo "Finally Actions"
    }
}
