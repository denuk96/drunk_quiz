require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DrunkQuiz
  class Application < Rails::Application
    config.load_defaults 6.1
    config.generators.system_tests = nil
    config.generators.test_framework false
    config.eager_load_paths << Rails.root.join('lib')
  end
end
