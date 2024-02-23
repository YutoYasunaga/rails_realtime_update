# frozen_string_literal: true

set :stage, :production
set :rails_env, :production
set :branch, 'main'
server '54.178.20.244', user: 'deploy', roles: %w[web app db]
