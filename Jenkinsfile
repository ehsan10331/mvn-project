pipeline{
    agent any
    stages{
        stage("demo-1"){
         steps{
            git branch: 'main', credentialsId: 'github-credential', url: 'https://github.com/ehsan10331/mvn-project'
        }
        }
        stage("maven"){
         steps{
            sh "mvn clean package"
        }
        }
        stage("deploy to tomcat"){
         steps{
            sshagent(['dev-tomcat']) {
    // some block
    sh "scp -o StrictHostKeyChecking=no target/mvn-project.war ec2-user@172.31.32.127:/opt/tomcat9/webapps"
    sh "ssh ec2-user@172.31.32.127 /opt/tomcat9/bin/shutdown.sh"
    sh "ssh ec2-user@172.31.32.127 /opt/tomcat9/bin/startup.sh"
}
        }
        }
    }
    }
