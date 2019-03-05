pipeline{
  
  agent{
   label "slave1" 
  }

stages{
    stage("maven build and deploy"){
      steps{
       sh(script:'mvn install -f trucks/pom.xml') 
      }
    }
      
    stage("Build docker image tag and push"){
    steps{
    sh "docker build --tag webapp ~/AbcabWebApplication"
    sh "docker tag webapp venkatr87/webapp2:${BUILD_NUMBER}"
    sh "docker login -u venkatr87 --password-stdin Rhidhev1418"
    sh "docker push venkatr87/webapp2:${BUILD_NUMBER}"
    }
    }
   }
    
