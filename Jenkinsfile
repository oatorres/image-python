// comment
pipeline {
 agent any
 stages {
        stage('Checkout-git'){
               steps{
		git poll: true, url: 'git@github.com:oatorres/test-jenkins-home.git'
               }
        }
        stage('CreateVirtualEnv') {
            steps {
				sh '''
					bash -c "virtualenv entorno_virtual_test && source entorno_virtual_test/bin/activate"
				'''

            }
        }
        stage('InstallRequirements') {
            steps {
            	sh '''
            		bash -c "source ${WORKSPACE}/entorno_virtual_test/bin/activate && ${WORKSPACE}/entorno_virtual_test/bin/python ${WORKSPACE}/entorno_virtual_test/bin/pip install -r requirements.txt"
                '''
            }
        }   
        stage('TestApp') {
            steps {
            	sh '''
            		bash -c "source ${WORKSPACE}/entorno_virtual_test/bin/activate &&  cd src && ${WORKSPACE}/entorno_virtual_test/bin/python ${WORKSPACE}/entorno_virtual_test/bin/pytest && cd .."
                '''
            }
        }  
        stage('RunApp') {
            steps {
            	sh '''
            		bash -c "source entorno_virtual_test/bin/activate ; ${WORKSPACE}/entorno_virtual_test/bin/python src/main.py &"
                '''
            }
        } 
        stage('BuildDocker') {
            steps {
            	sh '''
            		docker build -t imagetest:latest .
                '''
            }
        } 
    stage('PushDockerImage') {
            steps {
            	sh '''
            		docker tag imagetest:latest oscar08/imagetest:latest
					docker push oscar08/imagetest:latest
					docker rmi imagetest:latest
                '''
            }
        } 
  }
}

