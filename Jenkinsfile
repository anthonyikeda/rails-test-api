pipeline {
  agent { label 'ruby' }
  stages {
    stage("setup") {
      steps {
        sh "/home/jenkins/.rbenv/bin/rbenv install"
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

