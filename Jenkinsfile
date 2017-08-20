pipeline {
  agent { label 'ruby' }
  stage("setup") {
    steps {
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

