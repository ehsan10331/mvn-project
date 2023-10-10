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
                    nexusUrl: '52.23.241.101:8081', 
                    nexusVersion: 'nexus3', 
                    protocol: 'http', 
                    repository: 'mvn-project-release', 
                    version: '1.1'
            }
        }
        stage("deploy to dev"){
            steps{
                sshagent(['dev-tomcat']) {
        // COPY WAR FILE TO TOMCAT
        sh "scp -o StrictHostKeyChecking=no target/mvn-project.war ec2-user@172.31.80.147:/opt/tomcat9/webapps"
        // SHUTDOWN TOMCAT
         sh "ssh ec2-user@172.31.80.147 /opt/tomcat9/bin/shutdown.sh"
         //START TOMCAT
         sh "ssh ec2-user@172.31.80.147 /opt/tomcat9/bin/startup.sh"
        
        }
            }
        }
    }
}
