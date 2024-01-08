pipeline{
    agent any
    
    stages{
        stage('who am I'){
            steps{
                echo "========Who AM I========"
                sh '''
                whoami
                '''
            }
            post{
                success{
                    echo "========Git Clone executed successfully========"
                }
                failure{
                    echo "========Git Clone execution failed========"
                }
            }
        }


        stage('git clone'){
            steps{
                echo "========Git Clone========"
                sh '''
                rm -rf JobPortal
                '''

                sh "git clone https://github.com/karthik-intelizign/JobPortal.git"
            }
            post{
                success{
                    echo "========Git Clone executed successfully========"
                }
                failure{
                    echo "========Git Clone execution failed========"
                }
            }
        }

        stage('docker build'){
            steps{
                echo "========building docker image==========="
                sh '''
                   cd JobPortal
                   sudo docker build -t karthik759/job-portal:latest .

                '''
            }
            post{
                success{
                    echo "========Docker build executed successfully========"
                }
                failure{
                    echo "========Docker build execution failed========"
                }
            }
        }

        stage('Push image to Docker hub'){
            steps{
                script {
                    withCredentials([usernamePassword(credentialsId: 'DOCKER_HUB', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')])
                    {
                        sh "sudo docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD"
                        sh "sudo docker push karthik759/job-portal:latest"
                    }

                }
            }
            post{
                success{
                    echo "========Docker push executed successfully========"
                }
                failure{
                    echo "========Docker push execution failed========"
                }
            }
        }

        stage('docker run'){
            steps{
                echo "========executing docker image==========="
                sh '''
                   sudo docker run -p 8000:8000 job-portal
                   sleep 20
                   echo "============Final Out======================="
                   curl http://localhost:8000/polls/
                   echo "============Final Out======================="

                '''
            }
            post{
                success{
                    echo "========Docker run executed successfully========"
                }
                failure{
                    echo "========Docker run execution failed========"
                }
            }
        }
    }

    post{
        always{
            echo "========always========"
        }
        success{
            echo "========pipeline executed successfully ========"
        }
        failure{
            echo "========pipeline execution failed========"
        }
    }
}