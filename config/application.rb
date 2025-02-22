# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MetaSurfForecast
  class Application < Rails::Application
    config.load_defaults '6.0'

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.time_zone = 'UTC'

    config.force_ssl = true

    # Disable view rendering logs
    config.action_view.logger = nil
  end
end

EXPIRE_ON_UPDATE_KEY = :expire_on_update
