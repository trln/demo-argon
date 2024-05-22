require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Argon
  class Application < Rails::Application

  config.before_configuration do
      env_file = File.join(Rails .root, 'config', 'local_env.yml')
      if File.exist?(env_file)
        YAML.load_file(env_file).each { |key, value| ENV[key.to_s] = value }
      end
  end

  config.active_support.cache_format_version = 7.1
    


    # Initialize configuration defaults for originally generated Rails version.
    #config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.action_mailer.default_options = { from: ENV['ADMIN_EMAIL'] }
  end
end
