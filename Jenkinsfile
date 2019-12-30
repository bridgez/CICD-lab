pipeline {
   agent any
   //checkout scm
   stages {
      stage('Build image') {
        steps {
          echo 'Building on 18:25...'
          sh 'docker build -t cicd1 .'
          echo "Running ${env.BUILD_ID} ${env.BUILD_DISPLAY_NAME} on ${env.NODE_NAME} and JOB ${env.JOB_NAME}"
        }
   }
   stage('Test') {
     steps {
        echo 'Testing...'
     }
   }
   stage('Deploy') {
     steps {
       echo 'Deploying...'
     }
   }
  }
}
