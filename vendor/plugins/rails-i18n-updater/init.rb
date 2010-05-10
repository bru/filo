require 'rails_i18n_updater/config'

# Rails plugin initialization: add Rails core locales to I18n.load_path
# - only add locales that are actually used in the application
# - prepend locales so that they can be overwritten by the application
#
# We do this after_initialize as the I18n.load_path might be modified
# in a Rails initializer.
class Rails::Initializer
  def after_initialize_with_rails_locales
    after_initialize_without_rails_locales
    used_locales = I18n.load_path.map { |f| File.basename(f).gsub(/\.(rb|yml)$/, '') }.uniq
    files_to_add = Dir[File.join(RailsI18nUpdater::Config.local_path, '**', "{#{used_locales.join(',')}}.{rb,yml}")]
    I18n.load_path.unshift(*files_to_add)
  end
  alias_method_chain :after_initialize, :rails_locales
end
