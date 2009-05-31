class User < ActiveRecord::Base
  acts_as_authentic

  def gravatar_url
    require 'md5'
    hash = MD5::md5(email.downcase)
    "http://www.gravatar.com/avatar/#{hash}?s=150"
  end
end
