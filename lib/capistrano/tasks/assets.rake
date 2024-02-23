# frozen_string_literal: true

namespace :deploy do
  namespace :assets do
    Rake::Task['deploy:assets:precompile'].clear_actions

    desc 'Precompile assets locally and upload to servers'
    task :precompile do
      on roles(fetch(:assets_roles)) do
        # Local assets precompile
        run_locally do
          with rails_env: fetch(:rails_env) do
            execute 'rm -rf public/assets'
            execute 'rm -rf public/vite'
            execute 'rails assets:precompile RAILS_ENV=production'
          end
        end

        # Upload to server
        within release_path do
          with rails_env: fetch(:rails_env) do
            execute "rm -rf #{shared_path}/public/assets"
            upload!('./public/assets/', "#{shared_path}/public/", recursive: true)
            upload!('./public/vite/', "#{release_path}/public/", recursive: true)
          end
        end
      end
    end
  end
end
