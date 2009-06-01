xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Tapioca Collective"
    xml.description "A Web design and development group."
    xml.link "http://tapiocacollective.com/"

    for post in @posts
      xml.item do
        xml.title post[:title]
        xml.author post[:username]
        xml.description "#{post[:description]}..."
        xml.pubDate post[:published_at]
        xml.link post[:url]
        xml.guid post[:url]
      end
    end
  end
end
