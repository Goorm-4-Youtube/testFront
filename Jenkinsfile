pipeline { 
  agent any

  environment {
      repository = "shk230/goorm-myweb"  // repository name of your docker hub 
      DOCKERHUB_CREDENTIALS = credentials('dockerhub') // jenkins에 등록해 놓은 docker hub credentials 이름
      dockerImage = ' ' 
  }
  stages {
      stage('Cloning front-end Git') {
            steps { 
                git 'https://github.com/Goorm-4-Youtube/testFront.git'  //GitClone
            }
        } 
      stage('Build an image') { 
          steps { 
              script { 
                  sh "docker build -t $repository:v"$BUILD_NUMBER" // docker image build
              }
          } 
      }
      stage('Dockerhub Login'){
          steps{
              sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin' // docker hub login
          }
      }
      stage('Push our front-end image') { 
          steps { 
              script {
                sh 'docker push $repository:$BUILD_NUMBER' //docker image push
              } 
          }
      } 
      stage('Cleaning up') { 
		  steps { 
              sh "docker rmi $repository:$BUILD_NUMBER" // docker image remove
          }
      } 
  }
    }
