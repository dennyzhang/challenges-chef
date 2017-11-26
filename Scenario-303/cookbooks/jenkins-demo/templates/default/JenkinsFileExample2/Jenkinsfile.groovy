node {
    // // http://www.commandlinefu.com/commands/view/3584/remove-color-codes-special-characters-with-sed
    // // parameters: slack_channel, slack_domain, slack_token
    // // get who has triggered the pipeline job
    // def sh_command = "head -n 1 $HUDSON_HOME/jobs/$JOB_BASE_NAME/builds/$BUILD_NUMBER/log | awk -F'=' '{print \$2}' | sed -r \"s/\\x1B\\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g\""
    // def username = sh(script: sh_command, returnStdout: true)
    // username = username.trim()
    // def job_name = sh(script: "echo $JOB_BASE_NAME", returnStdout: true)
    // job_name = job_name.trim()
    // slackSend channel: slack_channel, message: 'Job(' + job_name + ') has been triggered by ' + username, teamDomain: slack_domain, tokenCredentialId: slack_token

    try {
        stage('Build') {
            echo 'Building..'
        }
        stage('Test') {
            build job: "CommonServerCheckRepo"
        }
        if (whether_skip_deploy == "false") {
            stage('Deploy') {
                echo 'Deploying....'
           }
        }
    }
    finally {
        echo "Finally Actions"
    }
}
