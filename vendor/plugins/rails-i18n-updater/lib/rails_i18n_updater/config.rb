module RailsI18nUpdater
  class Config
    class << self
      # Repository URL to fetch locales from
      def repository_url
        'git://github.com/svenfuchs/rails-i18n.git'
      end

      # Repository branch to use
      def repository_branch
        'master'
      end

      # Path within repository to fetch
      def repository_path
        'rails/locale'
      end

      # Local path where to store fetched locales
      def local_path
        File.join(Rails.root, 'vendor', 'rails-locales')
      end
    end
  end
end
