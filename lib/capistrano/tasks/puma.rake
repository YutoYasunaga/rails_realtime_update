# frozen_string_literal: true

namespace :puma do
  Rake::Task['puma:reload'].clear_actions

  desc 'Restart puma before finishing deployment'
  task :reload do
    on roles(:app) do
      execute "sudo systemctl restart puma_#{fetch(:application)}_#{fetch(:stage)}.service"
    end
  end
end
