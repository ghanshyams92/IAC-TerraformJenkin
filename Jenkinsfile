  pipeline {
    agent {
      node {
        label "master"
      } 
    }
    stages {
      stage('Fetch Latest_Code') {
        steps {
          git credentialsId: '17371c59-6b11-42c7-bb25-a37a9febb4db', url: 'https://github.com/ghanshyams92/IAC-TerraformJenkin'
        }
      }
    }
      stage('TF Unit Test') {
        steps {
          sh 'terraform validate'
        }      
      }
      
      stage('TF Init&Plan') {
        steps {
          sh 'terraform init'
          sh 'terraform plan'
        }      
      }

      stage('Approval') {
        steps {
          script {
            def userInput = input(id: 'confirm', message: 'Apply Terraform?', parameters: [ [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Apply terraform', name: 'confirm'] ])
          }
        }
      }

      stage('TF Apply') {
        steps {
          sh 'terraform plan -input=false'
        }
      }
    } 
  }
