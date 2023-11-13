pipeline {
    agent any
    
    options {
        buildDiscarder(logRotator(numToKeepStr: '5'))
        timestamps()
    }
    
    stages {
        stage('Checkout') {
            steps {
                // Checkout your Terraform code from your GitHub repository
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/your-username/your-repo.git']]])
            }
        }

        stage('Initialize Terraform') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Apply Terraform Changes - DEV') {
            when {
                environment name: 'BRANCH_NAME', value: 'dev'
            }
            steps {
                sh 'terraform apply -var-file=dev.tfvars -auto-approve'
            }
        }

        stage('Apply Terraform Changes - TEST') {
            when {
                environment name: 'BRANCH_NAME', value: 'test'
            }
            steps {
                sh 'terraform apply -var-file=test.tfvars -auto-approve'
            }
        }

        stage('Apply Terraform Changes - STAGING') {
            when {
                environment name: 'BRANCH_NAME', value: 'staging'
            }
            steps {
                sh 'terraform apply -var-file=staging.tfvars -auto-approve'
            }
        }

        stage('Apply Terraform Changes - PROD') {
            when {
                environment name: 'BRANCH_NAME', value: 'prod'
            }
            steps {
                sh 'terraform apply -var-file=prod.tfvars -auto-approve'
            }
        }

        stage('Deploy to ECS') {
            steps {
                sh 'ecs-deploy.sh'
            }
        }
    }

    post {
        always {
            sh 'terraform destroy -var-file=dev.tfvars -auto-approve'
        }
    }
}
