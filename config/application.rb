require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TwitterClone
  class Application < Rails::Application
    config.load_defaults 5.2
    config.time_zone = 'Tokyo'
    config.i18n.load_path +=
      Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :ja

    config.generators do |g|
      g.skip_routes true
      g.stylesheets false
      g.javascripts false
      g.helper false
      g.test_framework :rspec,
        routing_specs: false,
        controller_specs: false,
        view_specs: false,
        helper_specs: false,
        fixture: true
    end
  end
end