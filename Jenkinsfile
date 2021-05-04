  pipeline {
    agent {
      node {
        label "master"
      } 
    }
    environment {
      ibmcloud_api_key="${API_ACCESS_KEY}"
      iaas_classic_username="${API_CLASSIC_USERNAME}"
      iaas_classic_api_key="${API_CLASSIC_KEY}"
    }
    stages {
      stage('Fetch Latest_Code') {
        steps {
          git credentialsId: '17371c59-6b11-42c7-bb25-a37a9febb4db', url: 'https://github.com/ghanshyams92/IAC-TerraformJenkin'
        }
      }
      
      stage('TF Unit Test') {
        steps {
          sh 'terraform validate'
        }      
      }
      
      stage('TF Init&Plan') {
        steps {
           sh """
           export ibmcloud_api_key=${API_ACCESS_KEY}
           export iaas_classic_username=${API_CLASSIC_USERNAME}
           export iaas_classic_api_key=${API_CLASSIC_KEY}
           terraform init
           terraform plan -var 'ibmcloud_api_key=${API_ACCESS_KEY}' -var 'iaas_classic_username=${API_CLASSIC_USERNAME}' -var 'iaas_classic_api_key=${API_CLASSIC_KEY}'
           """
        }      
      }

      stage('Approval') {
        steps {
          script {
            def userInput = input(id: 'confirm', message: 'Apply Terraform?', parameters: [ [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Apply terraform', name: 'confirm'] ])
          }
        }
      }

      stage('Provision Infra in Target Cloud') {
        steps {
           sh """
           export ibmcloud_api_key=${API_ACCESS_KEY}
           export iaas_classic_username=${API_CLASSIC_USERNAME}
           export iaas_classic_api_key=${API_CLASSIC_KEY}
           terraform apply -var 'ibmcloud_api_key=${API_ACCESS_KEY}' -var 'iaas_classic_username=${API_CLASSIC_USERNAME}' -var 'iaas_classic_api_key=${API_CLASSIC_KEY}' -auto-approve -input=false
           """
        }
      }
      stage('Show') {
        steps {
           sh """
           export ibmcloud_api_key=${API_ACCESS_KEY}
           export iaas_classic_username=${API_CLASSIC_USERNAME}
           export iaas_classic_api_key=${API_CLASSIC_KEY}
           terraform show -var 'ibmcloud_api_key=${API_ACCESS_KEY}' -var 'iaas_classic_username=${API_CLASSIC_USERNAME}' -var 'iaas_classic_api_key=${API_CLASSIC_KEY}'
           """
        }
      }
    } 
  }
