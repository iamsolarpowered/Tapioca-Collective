module ClientsHelper

  def formatted_address client
    if client.address
      a = []

      a << client.address.gsub(/\n/, '<br />') if client.address
      a << '<br />'
      a << client.city
      a << ', '
      a << client.province
      a << ' '
      a << client.postal_code
      a << '<br />'
      a << client.country

      a.join
    end
  end

  def map_link client
    if formatted_address(client)
      url = "http://maps.google.com/maps?f=q&source=s_q&hl=en&geocode=&q=#{formatted_address(client).gsub('<br />', ', ')}&z=16&iwloc=A"
      "<small>#{link_to '[map]', url, :target => '_blank'}</small>"
    end
  end

end
