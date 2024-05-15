def installTerraform() {
    // Check if terraform is already installed
    def terraformExists = sh(script: 'which terraform', returnStatus: true)
    if (terraformExists != 0) {
        // Install terraform
        sh '''
            echo "Installing Terraform..."
            wget https://releases.hashicorp.com/terraform/1.0.0/terraform_1.0.0_linux_amd64.zip
            unzip terraform_1.0.0_linux_amd64.zip
            sudo mv terraform /usr/local/bin/
            rm -f terraform_1.0.0_linux_amd64.zip
        '''
    } else {
        echo "Terraform already installed!"
    }
}

pipeline {

environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }
    agent any

    stages {
        stage('checkout') {
            steps {
                 script{
                        dir("terraform")
                        {
                            git "https://github.com/pxaggar100/Library.git"
                        }
                    }
                }
            }

        stage('Install Terraform') {
            steps {
                script {
                  installTerraform()
            }

          }
	}
        stage('Terraform Deployment') {
            steps {
                script {
                    // CD into deployment folder and run terraform commands
                    dir('deployment') {
                        sh '''
                            terraform init
                            terraform plan
                            terraform apply -auto-approve
                        '''
                    }
                }
            }
        }
    }
}
