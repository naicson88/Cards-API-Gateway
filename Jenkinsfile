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
        		
	    stage('Sonar scan execution') {
		    // Run the sonar scan
		    steps {
			script {

			    withSonarQubeEnv {

				sh "'${mvnHome}/bin/mvn'  verify sonar:sonar -Dintegration-tests.skip=true -Dmaven.test.failure.ignore=true"
			    }
			}
		    }
	   }
	// waiting for sonar results based into the configured web hook in Sonar server which push the status back to jenkins
	 stage('Sonar scan result check') {
	    steps {
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
	 }

	    stage('Build Docker Image') {
	      // build docker image
	      dockerImage = docker.build("devopsexample:${env.BUILD_NUMBER}")
	    }
	    stage('Deploy Docker Image'){

	      // deploy docker image to nexus

	      echo "Docker Image Tag Name: ${dockerImageTag}"

		  sh "docker stop devopsexample"

		  sh "docker rm devopsexample"

		  sh "docker run --name devopsexample -d -p 2222:2222 devopsexample:${env.BUILD_NUMBER}"

		  // docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
	      //    dockerImage.push("${env.BUILD_NUMBER}")
	      //      dockerImage.push("latest")
	      //  }

	    }
	}A
