def app

pipeline {

    stages {
        stage("build") {
            steps {
                script {
                    app = docker.build('xetius/hanzo')
                }
            }
        }

        stage('run unit tests') {
            steps {
                script {
                    app.inside {
                        sh 'run_unit_tests.sh'
                    }
                }
            }
        }

        stage('push image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                        app.push("${env.BUILD_NUMBER}")
                        app.push('latest')
                    }
                }
            }
        }
    }
}