pipeline {
    agent any
    environment {
        AWS_ACCOUNT_ID = credentials('accoud_ID')
        AWS_DEFAULT_REGION="us-east-1"     
    }
        
    stages {
        stage('Infrastructure Deployment') {
           environment {
             AWS_ACCESS_KEY_ID = credentials('access-key')
             AWS_SECRET_ACCESS_KEY = credentials('secret-key')
           }
           steps {
              script {
                  sh "terraform init"
                  sh "terraform validate"
                  sh "terraform plan"
                  sh "terraform ${action} --auto-approve"
            }
        }
               
     }
    }
    
}
