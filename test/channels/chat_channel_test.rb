require 'test_helper'

class ChatChannelTest < ActionCable::Channel::TestCase
  test 'subscribes and stream for room' do
    # Simulate a subscription creation by calling `subscribe`
    subscribe room_id: '15'

    # You can access the Channel object via `subscription` in tests
    assert subscription.confirmed?
    assert_has_stream 'chat_room_15'
  end
end
