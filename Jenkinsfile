pipeline {
  agent { label 'ruby' }
  stages {
    stage("setup") {
      steps {
        sh "source /home/jenkins/.bashrc"
        sh "rbenv install"
      }
    }
    stage("Load gems") {
      steps {
        sh "gem install bundler"
        sh "bundle install"
      }
    }
  }
}

