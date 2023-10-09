pipeline{
    agent any
    parameters {
  choice choices: ['dev', 'test', 'prod'], description: 'Choose the environment to deploy', name: 'envName'
}

    stages{
        stage("maven"){
            when {
                expression { params.envName == "dev" }
            }
            steps{
                sh "mvn clean package"
            }
        }
        stage("deploy to dev"){
            when { 
                expression { params.envName == "dev" }
            }
            steps{
                echo params.envName
                    echo "Deploy to dev environment"
        
        }
            }
            stage("deploy to test"){
                 when { 
                expression { params.envName == "test" }
            }
            steps{
                echo params.envName
                    echo "deploy to test environment"
        }
            }
                stage("deploy to prod"){
                     when { 
                expression { params.envName == "prod" }
            }
            steps{
                echo params.envName
                    echo "deploy to production"
                 sshagent(['dev-tomcat']) {
        // COPY WAR FILE TO TOMCAT
        sh "scp -o StrictHostKeyChecking=no target/mvn-project.war ec2-user@172.31.43.84:/opt/tomcat9/webapps"
        // SHUTDOWN TOMCAT
         sh "ssh ec2-user@172.31.43.84 /opt/tomcat9/bin/shutdown.sh"
                 }

        }
    }
}
}
 
