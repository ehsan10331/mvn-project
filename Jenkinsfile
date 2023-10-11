pipeline{
    agent any
    stages{
        stage("maven"){
            steps{
                sh "mvn clean package"
            }
        }
        stage("nexus deploy"){
            steps{
                nexusArtifactUploader artifacts: [[artifactId: 'mvn-project', classifier: '', file: 'target/mvn-project.war', type: 'war']], 
                    credentialsId: 'nexus3', 
                    groupId: 'com.icici', 
                    nexusUrl: '34.238.157.116:8081', 
                    nexusVersion: 'nexus3', 
                    protocol: 'http', 
                    repository: 'mvn-project-release', 
                    version: '1.3'
            }
        }
        stage("deploy to test"){
            steps{
                sshagent(['dev-tomcat']) {
        // COPY WAR FILE TO TOMCAT
        sh "scp -o StrictHostKeyChecking=no target/mvn-project.war ec2-user@172.31.47.100:/opt/tomcat9/webapps"
        // SHUTDOWN TOMCAT
         sh "ssh ec2-user@172.31.47.100 /opt/tomcat9/bin/shutdown.sh"
         //START TOMCAT
         sh "ssh ec2-user@172.31.47.100 /opt/tomcat9/bin/startup.sh"
        
        }
            }
        }
    }
}
