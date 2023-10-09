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
        }
    }
}
}
 
