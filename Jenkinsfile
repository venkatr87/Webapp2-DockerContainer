pipeline{
  
  agent{
   label "slave1" 
  }

stages{
   stage("maven build and deploy"){
      steps{
       sh(script:'mvn clean package') 
      }
    }
      
   stage("Build docker image tag and push"){
     steps{
       sh "docker login -u venkatr87 -p Rhidhev1418"
       sh "docker build --tag webapp ~/AbcabWebApplication"
       sh "docker tag webapp venkatr87/webapp2:${BUILD_NUMBER}"
       sh "docker push venkatr87/webapp2:${BUILD_NUMBER}"
    }
    stage("Deploy")
     steps{
       sh "ssh -tt -v -o StrictHostKeyChecking=no root@{params.Environment IP} 'docker run -it -d --name webapp2 -p 8888:8888 venkatr87/webapp2:${BUILD_NUMBER}'"
        }
    }
  }   
}
