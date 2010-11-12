require File.dirname(__FILE__) + "/spec_helper"

describe Clock do
  def redefine_clock_as(clock_type)
    silence_warnings { Object.const_set(:Clock, Class.new()) }
    load "#{File.dirname(__FILE__)}/../lib/clock/#{clock_type}.rb"
    load "#{File.dirname(__FILE__)}/../lib/clock/clock.rb"
  end

  after(:each) do
    redefine_clock_as(:mock_clock)
  end

  describe "mock clock" do
    before(:each) do
      redefine_clock_as(:mock_clock)
      reset_clock_mock
      @china_time_zone = ActiveSupport::TimeZone.new(8)
      Time.zone = @china_time_zone
    end

    it "time should be frozen" do
      now = Time.local(2007, 1, 1)
      Time.stub!(:now).and_return(now, now + 1)
      first_time = Clock.now
      Clock.now.should == first_time
    end

    describe "#now=" do
      it "converts parameter to time" do
        not_a_time = Date.parse("2008-10-30")
        not_a_time.should_not be_instance_of(Time)
        Clock.now = not_a_time
        Clock.now.should be_instance_of(Time)
      end
    end

    describe "#today" do
      it "returns a date" do
        Clock.today.should be_instance_of(Date)
      end

      it "respects time manipulations" do
        today = Clock.today
        Clock.tick(1.day)
        Clock.today.should == today + 1.day
      end
    end

    describe "#zone" do
      it "proxies the current time zone" do
        Clock.zone.target.should == @china_time_zone
      end
    end
  end

  describe "real clock" do
    before(:each) do
      redefine_clock_as(:real_clock)
      @china_time_zone = ActiveSupport::TimeZone.new(8)
      Time.zone = @china_time_zone
    end

    describe "#now" do
      it "returns Time.now" do
        Clock.now.should be_within(2).of(Time.now)
      end
    end

    describe "#today" do
      it "returns Date.today" do
        Clock.today.should == Date.today
      end
    end

    describe "#zone" do
      it "returns appropriate time" do
        Clock.zone.now.should be_within(2).of(@china_time_zone.now)
        Clock.zone.today.should == @china_time_zone.today
      end
    end
  end
end
