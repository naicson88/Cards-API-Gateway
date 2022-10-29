node {
	    // reference to maven
	    // ** NOTE: This 'maven-3.5.2' Maven tool must be configured in the Jenkins Global Configuration.   
	    def mvnHome = tool 'maven-3.5.2'
	    // holds reference to docker image
	    def dockerImage
	    // ip address of the docker private repository(nexus)
	    def dockerImageTag = "devopsexample${env.BUILD_NUMBER}"
	    
	    stage('Clone Repo') { // for display purposes
	      // Get some code from a GitHub repository
	      git 'https://github.com/naicson88/Cards-API-Gateway.git'
	      // Get the Maven tool.
	      // ** NOTE: This 'maven-3.5.2' Maven tool must be configured
	      // **       in the global configuration.           
	      mvnHome = tool 'maven-3.5.2'
	    }    
	  
	    stage('Build Project') {
	      // build project via maven
	      sh "'${mvnHome}/bin/mvn' clean install"
	    }			

	}
