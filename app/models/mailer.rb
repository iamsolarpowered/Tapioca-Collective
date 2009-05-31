class Mailer < ActionMailer::Base


  def simple_message(args, sent_at = Time.now)
    subject    args[:subject]
    recipients args[:recipients]
    from       args[:from]
    sent_on    sent_at

    body       args[:body]
  end

end
