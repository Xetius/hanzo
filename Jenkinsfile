pipeline {
    agent any
    stages {
        stage("build") {
            steps {
                script {
                    def app = docker.build("xetius/hello:${env.BUILD_NUMBER}")
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

        stage("Dev") {
            steps {
                script {
                    deployToKubernetes(this, "dev")
                    executeComponentTests()
                }
            }
        }

        stage("UAT") {
            steps {
                script {
                    deployToKubernetes(this, "uat")
                    executeEndToEndUiTests()
                }
            }
        }

        stage("Staging") {
            steps {
                script {
                    deployToKubernetes(this, "staging")
                }
            }
        }

        stage("Production") {
            steps {
                script {
                    deployToKubernetes(this, "production")
                }
            }
        }
    }
    post {
        success {
            echo "Build succeeded"
        }
        failure {
            echo "Build failed"
        }
    }
}

def deployToKubernetes(def script, String namespace) {
    script.sh 'kubectl get ns ${namespace} || kubectl create ns ${namespace}'

    script.sh 'kubectl apply --namespace=${namespace} -f k8s/${namespace}/configMap.yml'
    script.sh 'kubectl apply --namespace=${namespace} -f k8s/deployment.yml'
    script.sh 'kubectl apply --namespace=${namespace} -f k8s/service.yml'
}