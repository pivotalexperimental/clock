require 'rails'
require 'clock/clock'

module Pivotal
  module Clock
    class Railtie < ::Rails::Engine
      config.autoload_paths << File.expand_path(File.join(File.dirname(__FILE__), 'clock'))
      config.before_configuration do
        ::Clock.use_mock_clock? ? require("clock/mock_clock") : require('clock/real_clock')
      end
    end
  end
end
