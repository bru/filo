namespace :i18n do
  desc 'Update (download) Rails core translations'
  task :update do
    require File.join(File.dirname(__FILE__), '..', 'lib', 'rails_i18n_updater', 'config')
    temp_path = "#{RailsI18nUpdater::Config.local_path}.tmp"
    sh <<-EOC
      rm -rf #{temp_path} && \
      git clone -q --depth 1 #{RailsI18nUpdater::Config.repository_url} #{temp_path} && \
      cd #{temp_path} && \
      git checkout -q #{RailsI18nUpdater::Config.repository_branch} && \
      rm -rf #{RailsI18nUpdater::Config.local_path} && \
      mv #{File.join(temp_path, RailsI18nUpdater::Config.repository_path)} #{RailsI18nUpdater::Config.local_path} && \
      rm -rf #{temp_path}
    EOC
  end
end
