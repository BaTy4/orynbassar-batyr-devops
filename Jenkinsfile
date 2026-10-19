pipeline {
    agent any

    environment {
        STUDENT_NAME = 'Batyr'
        STUDENT_SURNAME = 'Orynbassar'
        STUDENT_GROUP = 'IT2-2308'
        STUDENT_ID = '38316'
        IMAGE_NAME = 'orynbassar-batyr-devops'
        CONTAINER_NAME = 'orynbassar-batyr-ci'
    }

    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out project from GitHub'
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo 'Building and checking the application'
                sh 'python3 -m py_compile app/app.py'
                sh 'test -f Dockerfile'
                sh 'test -f docker-compose.yml'
            }
        }

        stage('Test') {
            steps {
                echo 'Testing student application'
                sh '''
                    OUTPUT=$(python3 app/app.py)
                    echo "$OUTPUT"
                    echo "$OUTPUT" | grep -q "Batyr"
                    echo "$OUTPUT" | grep -q "IT2-2308"
                    echo "$OUTPUT" | grep -q "38316"
                    echo "$OUTPUT" | grep -q "Application is running successfully!"
                '''
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t "$IMAGE_NAME:$BUILD_NUMBER" .'
            }
        }

        stage('Docker Run') {
            steps {
                sh '''
                    docker rm -f "$CONTAINER_NAME" 2>/dev/null || true

                    docker run --name "$CONTAINER_NAME" \
                      -e STUDENT_NAME="$STUDENT_NAME" \
                      -e STUDENT_SURNAME="$STUDENT_SURNAME" \
                      -e STUDENT_GROUP="$STUDENT_GROUP" \
                      -e STUDENT_ID="$STUDENT_ID" \
                      "$IMAGE_NAME:$BUILD_NUMBER" > container-output.txt

                    cat container-output.txt
                    grep -q "IT2-2308" container-output.txt
                    grep -q "38316" container-output.txt

                    docker rm "$CONTAINER_NAME"
                '''
            }
        }
    }

    post {
        success {
            echo 'Student: Batyr Orynbassar'
            echo 'Group: IT2-2308'
            echo 'Student ID: 38316'
            echo 'Finished: SUCCESS'
        }
        always {
            sh 'docker ps -a || true'
        }
    }
}
