pipeline {
    agent any

    environment {
        IMAGE_NAME = "harikrishna2125/devops-build-prod"
        IMAGE_TAG = "latest"
    }

    stages {

        stage('Checkout') {
    steps {
        checkout scm
    }
}

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME:$IMAGE_TAG .'
            }
        }

        stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh '''
                    echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                    '''
                }
            }
        }

        stage('Push Image') {
            steps {
                sh 'docker push $IMAGE_NAME:$IMAGE_TAG'
            }
        }
        stage('Deploy to App Server') {
    steps {
        sh '''
        ssh -o StrictHostKeyChecking=no ubuntu@54.221.19.52 "
            docker pull harikrishna2125/devops-build-prod:latest &&
            docker stop devops-app || true &&
            docker rm devops-app || true &&
            docker run -d \
                --name devops-app \
                --restart unless-stopped \
                -p 80:80 \
                harikrishna2125/devops-build-prod:latest
        "
        '''
    }
}
    }

    post {
        always {
            sh 'docker logout || true'
        }
    }
}
