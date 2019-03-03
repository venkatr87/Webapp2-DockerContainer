pipeline
{
   agent{
      label "slave1"
   }
   
  stages{
  stage("build"){
  steps{
    sh "mvn clean deploy" 
      }
  }
  }
} 
