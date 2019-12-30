pipeline {
   agent any
   //checkout scm
   stages {
      stage('Build image') {
        steps {
          echo 'Building image...'
           sh 'docker build -t cicd .'
          echo "Running ${env.BUILD_ID} ${env.BUILD_DISPLAY_NAME} on ${env.NODE_NAME} and JOB ${env.JOB_NAME}"
        }
   }
   stage('Push to registry') {
     steps {
        echo 'Pushing to registry...'
        sh 'docker login -u bridgez -p study708058'
        sh 'docker tag cicd docker.io/bridgez/cicd'
        sh 'docker push docker.io/bridgez/cicd'
     }
   }
   stage('Deploy Application') {
     steps {
       echo 'Deploying Application...'
        sh 'docker run -dit -p 80:80 bridgez/cicd'
     }
   }
  }
}
