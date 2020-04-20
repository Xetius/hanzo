pipeline {
    def app

    stages {
        stage('SCM') {
            checkout scm
        }

        stage("build") {
            app = docker.build('')
        }

        stage('run unit tests') {
            app.inside {
                sh 'run_unit_tests.sh'
            }
        }

        stage('push image') {
            docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                app.push("${env.BUILD_NUMBER}")
                app.push('latest')
            }
        }
    }
}