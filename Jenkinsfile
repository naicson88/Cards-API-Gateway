#!groovy

pipeline {
    agent any

    tools {
        maven "maven-3.5.2" // You need to add a maven with name "3.6.0" in the Global Tools Configuration page
    }

	stages {
		stage("Clone Repo") {
		    steps {
			  git 'https://github.com/naicson88/Cards-API-Gateway.git'
		    }
		}
		stage("Build Project") {
		    steps {
			   sh "'${maven}/bin/mvn' clean install"
		    }
		}
	    }

}
