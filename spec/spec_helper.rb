ENV["RAILS_ENV"] ||= "test"
require 'rails_app/config/environment'
require "rspec/rails"

#Spec::Example::ExampleGroupFactory.register(:functional, Spec::Rails::Example::FunctionalExampleGroup)
#Spec::Runner.configure do |configuration|
#  configuration.include CommonTestHelper
#  configuration.use_transactional_fixtures = true
#  configuration.use_instantiated_fixtures  = false
#  configuration.fixture_path = 'vendor/plugins/pivotal_core_bundle/spec/fixtures/'
#  configuration.global_fixtures = :all
#end

class Module
  def redefine_const(const_name, value)
    remove_const(const_name) if const_defined?(const_name)
    const_set(const_name, value)
  end
end

def reset_clock_mock
  Clock.now = Time.now if Clock.respond_to? :now=
end
