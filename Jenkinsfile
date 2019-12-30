pipeline {
   agent any
   //checkout scm
   stages {
      stage('Build image') {
        steps {
          echo 'Building on 18:25...'
           sh 'docker build -t cicd2 .'
          echo "Running ${env.BUILD_ID} ${env.BUILD_DISPLAY_NAME} on ${env.NODE_NAME} and JOB ${env.JOB_NAME}"
        }
   }
   stage('Push to registry') {
     steps {
        echo 'Testing...'
        sh 'docker login -u bridgez -p study708058'
        docker tag cicd2 docker.io/bridgez/cicd3
        docker push docker.io/bridgez/cicd3
     }
   }
   stage('Deploy') {
     steps {
       echo 'Deploying...'
     }
   }
  }
}
