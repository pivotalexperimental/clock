## Clock

Clock is a simple wrapper for Ruby's Time object, with a few fancy additions for testing. In test mode, Clock
will automatically load the mock_clock methods, allowing you to set the current time with <code>Clock.now=(time)</code>
and manually advance time with <code>Clock.tick(seconds)</code>.

In any other environment other than test, Clock will behave exactly like Time.

## Requirements

To initialize properly, this gem requires Rails 3.0 or above.