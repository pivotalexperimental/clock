class Clock
  def self.today
    self.now.to_date
  end
end

module Pivotal
  module Clock
    class Railtie < ::Rails::Railtie
      config.before_configuration do
        Pivotal::Clock.use_mock_clock? ? require("mock_clock") : require('real_clock')
      end
    end

    def self.use_mock_clock?
      return USE_MOCK_CLOCK if Object.const_defined?(:USE_MOCK_CLOCK)
      return ::Rails.env.test?
    end
  end
end
