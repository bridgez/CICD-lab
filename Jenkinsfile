pipeline {
   agent any
   //checkout scm
   stages {
      stage('Build image') {
        steps {
          echo 'Building image...'
	//  parameters {
       	//      string(name: 'build_tag', defaultValue: 'v2', description: 'version tag')
	//  }
	//  def build_tag = 'v2'
	//  script {
        //      build_tag = sh(returnStdout: true, script: 'git rev-parse --short HEAD').trim()
        //   if (env.BRANCH_NAME != 'master') {
        //      build_tag = "${env.BRANCH_NAME}-${build_tag}"
        //    }
	//  }
	//  sh 'docker build -t cicd:${build_tag} .'
	  sh "docker build -t cicd:v${BUILD_NUMBER}  ."
          echo "Running ${env.BUILD_ID} ${env.BUILD_DISPLAY_NAME} on ${env.NODE_NAME} and JOB ${env.JOB_NAME}"
        }
   }
   stage('Push to registry') {
     steps {
        echo 'Pushing to registry...'
	withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
	     sh "docker login -u ${dockerHubUser} -p ${dockerHubPassword}"
	     sh 'docker tag cicd:${BUILD_NUMBER} bridgez/cicd:v${BUILD_NUMBER}'
             sh 'docker push bridgez/cicd:v${BUILD_NUMBER}'
	}
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
