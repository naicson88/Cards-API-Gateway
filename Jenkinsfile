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
      steps {
        script {
          echo 'Pulling...'
          sh "'${mvnHome}/bin/mvn' clean install"
        }
      }
    }

    stage('Sonar scan execution') {
      // Run the sonar scan 'local-sonar' is defined as variable in jenkins config
      steps {
        withSonarQubeEnv(installationName: 'local-sonar') {
          sh "'${mvnHome}/bin/mvn'  verify sonar:sonar -Dintegration-tests.skip=true -Dmaven.test.failure.ignore=true"
        }
      }
    }

  }
}
