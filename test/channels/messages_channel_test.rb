require 'test_helper'

class MessagesChannelTest < ActionCable::Channel::TestCase
  test "subscribes and stream for messages" do
    # Simulate a subscription creation by calling `subscribe`
    subscribe

    # You can access the Channel object via `subscription` in tests
    assert subscription.confirmed?
    assert_has_stream 'messages'
  end
end
