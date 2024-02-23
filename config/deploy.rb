# frozen_string_literal: true

lock '~> 3.18'

set :application, 'rails_realtime_update'
set :repo_url, 'git@github.com:YutoYasunaga/rails_realtime_update.git'
set :deploy_to, "/deploy/sampleapps/#{fetch(:application)}"
set :pty, true
set :init_system, :systemd
set :keep_releases, 1

set :rbenv_type, :user
set :rbenv_ruby, File.read('.ruby-version').strip
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, fetch(:rbenv_map_bins).to_a.push('rake', 'gem', 'bundle', 'ruby', 'rails', 'puma', 'pumactl', 'sidekiq', 'sidekiqctl')
set :rbenv_roles, :all

set :bundle_flags, '--deployment'

set :puma_init_active_record, true
set :puma_phased_restart, true

append :linked_files, 'config/database.yml', 'config/application.yml'
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system', 'node_modules'
