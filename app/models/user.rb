class User < ActiveRecord::Base
  acts_as_authentic

  has_many :blogs

  def feed_urls
    urls = []
    self.blogs.each {|b| urls << b.feed_url }
    urls
  end

  def feed_urls=(urls)
    urls.each {|url| self.blogs.build :feed_url => url unless url.blank? }
  end

  def gravatar_url size = 150
    require 'md5'
    hash = MD5::md5(email.downcase)
    "http://www.gravatar.com/avatar/#{hash}?s=#{size}"
  end

  def username
    login
  end
end
