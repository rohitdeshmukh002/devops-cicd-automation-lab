pipeline {
    agent any

    stages {
        stage('Checkout Public Repo') {
            steps {
                // Replace with your actual public repository URL and branch name
                sh 'git clone -b main https://github.com/rohitdeshmukh002/devops-cicd-automation-lab . || true'
                sh 'git pull origin main || true'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh '''
                    python3 -m venv venv
                    . venv/bin/activate
                    pip install -r requirements.txt
                '''
            }
        }

        stage('Run Tests') {
            steps {
                sh '''
                    . venv/bin/activate
                    pytest tests/test_app.py
                '''
            }
        }
    }
}