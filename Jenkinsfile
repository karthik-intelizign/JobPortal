pipeline{
    agent any
    
    stages{
        stage('git clone'){
            steps{
                echo "========Git Clone========"
                sh '''
                ls -ltr
                echo "========ls -ltr========"
                ls -ld 
                df -h
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
                   docker build -t job-portal .

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

        stage('docker run'){
            steps{
                echo "========executing docker image==========="
                sh '''
                   docker run -p 8000:8000 job-portal
                   echo "============Final Out======================="
                   curl http://localhoast:8000/polls/
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