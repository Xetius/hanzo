def app

pipeline {

    stages {
        stage("build") {
            steps {
                app = docker.build('xetius/hanzo')
            }
        }

        stage('run unit tests') {
            steps {
                app.inside {
                    sh 'run_unit_tests.sh'
                }
            }
        }

        stage('push image') {
            steps {
                docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                    app.push("${env.BUILD_NUMBER}")
                    app.push('latest')
                }
            }
        }
    }
}