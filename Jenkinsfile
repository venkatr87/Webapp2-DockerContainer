pipeline
{
   agent{
      label "slave1"
   }
   
 parameters
{
 choice(name: 'Environment',choices: 'Dev\nUAT\nPRD',description: 'Please select Environment')
 string(name:  'servername',description: 'Please enter ip address of Machine where you want to deploy artifact')
 string(name:  'Jobname',description: 'Please Jobname to get ocation of artifact')
 string(name:  'ContainerId',description: 'Please Enter Container ID:')
}
  stages{
  stage("build"){
  steps{
    sh "mvn clean deploy" 
     sh "scp -v -o StrictHostKeyChecking=no /tmp/workspace/${params.Jobname}/target/AbcabWebApp.war root@${params.servername}:/tmp"
     sh "ssh -tt -v -o StrictHostKeyChecking=no root@172.31.24.224 'docker cp /tmp/AbcabWebApp.war ${params.ContainerId}:/usr/local/tomcat/webapps'"
     sh "curl -ls ${params.servername}:8888/AbcabWebApp | head -n 1 | cut -c 10-12" > $a
     sh "echo $a"
 
  }
  }
  }
} 
