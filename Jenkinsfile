def app

pipeline {
    agent any
    stages {
        stage("build") {
            steps {
                script {
                    def app = docker.build("xetius/hanzo:${env.BUILD_NUMBER}")
                    app.inside {
                        sh 'run_unit_tests.sh'
                    }
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                        app.push("${env.BUILD_NUMBER}")
                        app.push('latest')
                    }
                }
            }
        }

        stage('push image') {
            steps {
                script {
                }
            }
        }
    }
}