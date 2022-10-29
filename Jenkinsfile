#!groovy

pipeline {
    agent any

    tools {
        maven "maven-3.5.2" // You need to add a maven with name "3.6.0" in the Global Tools Configuration page
    }

    stages {
       stage('Clone Repo') { // for display purposes
	      // Get some code from a GitHub repository
	      git 'https://github.com/naicson88/Cards-API-Gateway.git'
	      // Get the Maven tool.
	      // ** NOTE: This 'maven-3.5.2' Maven tool must be configured
	      // **       in the global configuration.           
	      //mvnHome = tool 'maven-3.5.2'
	 } 
    }

    post {
        always {
            cleanWs()
        }
    }
}
