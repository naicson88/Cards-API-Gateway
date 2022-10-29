pipeline {
    agent { docker { image 'maven:3.5.2-openjdk-11' } }
    stages {
        stage('build') {
            steps {
                sh 'mvn --version'
            }
        }
    }
}
