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
    sh "docker build --tag webapp ~/AbcabWebApplication"
    sh "docker tag webapp venkatr87/webapp2:${BUILD_NUMBER}"
    sh "docker login -u venkatr87 --password-stdin Rhidhev1418"
    sh "docker push venkatr87/webapp2:${BUILD_NUMBER}"
    }
    }
   stage('kubernetes start deployment'){
    steps{
    sh (script: 'sed -i.bkp "s/IMAGE_TAG/${BUILD_NUMBER}/g" kubernetes/deployment.yaml')
    sh "kubectl apply -f kubernetes/deployment.yaml   
    }
    }
   stage('kubernetes deploy service'){
    steps{
    sh "kubectl apply -f kubernetes/service.yaml"    
    }
}
    
