pipeline {  
   environment {
     mvnHome = tool 'Maven 3.5.2'
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
            
          }
       }      
     }
   } 
 }
