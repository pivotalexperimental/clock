class Clock
  def self.today
    self.now.to_date
  end

  def self.use_mock_clock?
    return USE_MOCK_CLOCK if Object.const_defined?(:USE_MOCK_CLOCK)
    return ::Rails.env.test?
  end
end