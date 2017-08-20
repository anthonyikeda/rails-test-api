pipeline {
  agent { label 'ruby' }
  stages {
    stage("setup") {
      step {
        sh "rbenv install"
      }
      step {
        sh "gem install bundler"
        sh "bundle install"
      }
    }
  }
}

