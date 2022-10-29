pipeline {  
   environment {
     mvnHome = tool 'maven-3.5.2'
   }

   agent any  

   stages {   
     stage("Clone Repository") {     
       steps {       
          git 'https://github.com/naicson88/Cards-API-Gateway.git'  
       }      
     }
     stage("Build") {
       steps{  
          script{
             echo 'Pulling...'
             sh "'${mvnHome}/bin/mvn' clean install"
          }
       }      
     }
   } 
 }
