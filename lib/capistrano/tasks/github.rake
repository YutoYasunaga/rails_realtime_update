# frozen_string_literal: true

desc 'Push source code to Github'
task :github_push do
  run_locally do
    execute "git push origin #{fetch(:branch)}"
  end
end

before 'deploy:starting', :github_push
