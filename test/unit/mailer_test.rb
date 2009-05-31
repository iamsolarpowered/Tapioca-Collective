require 'test_helper'

class MailerTest < ActionMailer::TestCase
  test "simple_message" do
    @expected.subject = 'Mailer#simple_message'
    @expected.body    = read_fixture('simple_message')
    @expected.date    = Time.now

    assert_equal @expected.encoded, Mailer.create_simple_message(@expected.date).encoded
  end

end
