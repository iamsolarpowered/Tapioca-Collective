class Blog < ActiveRecord::Base
  require 'feed-normalizer'

  belongs_to :user

  serialize :feed_data, FeedNormalizer::Feed

  def self.recent_entries
    entries = []
    all.each {|b| entries << b.entries.first(3) if b.entries }
    entries.flatten.sort_by {|entry| entry.date_published }.reverse
  end

  def entries
    feed_data.entries if feed_data
  end

  def parsed_feed
    feed_data
  end

  def update_feed_data
    require 'open-uri'
    begin
      if feed = FeedNormalizer::FeedNormalizer.parse(open(feed_url))
        self.update_attributes :feed_data => feed, :feed_updated_at => Time.now
        return true
      end
    rescue => e
      puts "*** ERROR RETIEVING FEED ***"
      puts feed_url
      puts e
      return false
    end
  end
end
