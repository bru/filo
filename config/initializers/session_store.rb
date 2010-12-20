# ActionController::Base.session = {
#   :key         => '_filo2_session',
#   :secret      => 'e3b1aece455d7c30f7a3f76c299d7e92874b5376cd5bc817224e399d28adfa93fa9768c9be2c916ee1cf3a20c4e969dd338b5b3e71a4736f6d45915bb5d67ff4'
# }

Filo::Application.config.session_store :cookie_store, :key => '_filo_session'