pipeline {
    agent any 
    environment {
        IMAGE_NAME = 'sambit1996/spring:v2'
        KUBECONFIG = '/home/sambit/.kube/config'
    }
    
    stages {
        stage ('git clone') {
            steps {
                git 'https://github.com/sambit-8490/springboot-PJ2.git'
            }
        }  
        stage ('check') {
            steps {
                sh 'docker images -q ${IMAGE_NAME} | docker rmi -f ${IMAGE_NAME}'
            }
        }
        stage ('build') {
            steps {
                sh 'docker build -t ${IMAGE_NAME} /var/lib/jenkins/workspace/kubernetes-web-deploy/'
            }
        }
        stage ('login and push') {
            steps {
                withCredentials([string(credentialsId: 'dockerpw', variable: 'dockerpw')]) {
                sh 'docker login -u sambit1996 -p ${dockerpw}'
                    
                }
                sh 'docker push ${IMAGE_NAME}'
            }
        }
        stage ('kubernetes') {
             steps {
                sh 'kubectl apply -f ./ingress-deployment.yml'
            }
        }   
            
    }
    post {
        always {
            mail to: 'sambitkumarchaudhury786@gmail.com',
            subject: "successfully Deploy springboot-application in kubernetes ${BUILD_ID}",
            body: "Thisi is jenkins url ${BUILD_URL}"
        }
    }
}
