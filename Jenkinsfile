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

	}A

	// waiting for sonar results based into the configured web hook in Sonar server which push the status back to jenkins
	 stage('Sonar scan result check') {	    
		timeout(time: 2, unit: 'MINUTES') {
		    retry(3) {
			script {
			    def qg = waitForQualityGate()
			    if (qg.status != 'OK') {
				error "Pipeline aborted due to quality gate failure: ${qg.status}"
			     }
			 }
		     }
		 }     
	 }

	   stage('Sonar scan result check') {
		  steps{
		  	timeout(time: 1, unit: 'MINUTES') {
			  waitFotQualityGate abortPipeline: true
				
			     }
			 }     
		}
		
	   
