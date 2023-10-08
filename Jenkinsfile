// pipeline{
//     agent any
//     stages{
//         stage("maven"){
//             steps{
//                 sh "mvn clean package"
//             }
//         }
//         stage("deploy to dev"){
//             steps{
//                 sshagent(['dev-tomcat']) {
//         // COPY WAR FILE TO TOMCAT
//         sh "scp -o StrictHostKeyChecking=no target/mvn-project.war ec2-user@172.31.80.147:/opt/tomcat9/webapps"
//         // SHUTDOWN TOMCAT
//          sh "ssh ec2-user@172.31.80.147 /opt/tomcat9/bin/shutdown.sh"
//          //START TOMCAT
//          sh "ssh ec2-user@172.31.80.147 /opt/tomcat9/bin/startup.sh"
        
//         }
//             }
//         }
//     }
// }
