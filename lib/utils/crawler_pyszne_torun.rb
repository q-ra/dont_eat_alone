require 'nokogiri'
require 'open-uri'
require 'json'
require 'awesome_print'

restaurants_hash = {}

100.upto(124) do |page_number|
  website_html = Nokogiri::HTML open "https://pyszne.pl/restauracja-torun-87-#{page_number}#!"
  website_html.css('div.yd-jig-service-dl').each do |restaurant|
    address_suffix = restaurant.css('li.yd-jig-service-dl-info-name').css('a').attr('href').to_s[1..-1] #adres www.restauracji na pyszne.pl
    unless restaurants_hash.keys.include? address_suffix
      current_restaurant_address_general = 'https://pyszne.pl/' << address_suffix
      current_restaurant_address = current_restaurant_address_general  + '/informacje#!'
      current_restaurant_html = Nokogiri::HTML open current_restaurant_address
      div_with_detailed_info = current_restaurant_html.css('div.yd-jig-serviceinfo-details.yd-grid')
      detailed_address = current_restaurant_html.css('dd.adr')
      website_node = current_restaurant_html.css('div.yd-grid-11').map {|tag| tag.css('a')}.flatten[0]

      delivery_node = current_restaurant_html.css('.jig-serviceinfo-box').first.parent.css('span[itemprop="openingHours"]').first.parent
      delivery_price = delivery_node.to_s.scan(/(?:Koszt dostawy:.*?)(\d+,\d+)/).flatten.first.gsub(',', '.')
      minimal_delivery_price = delivery_node.to_s.scan(/(?:Dowóz:.*?)(\d+,\d+)/).flatten.first.gsub(',', '.')
      free_delivery = delivery_node.to_s.scan(/(?:Dostawa za darmo.*)(\d+,\d+)/).try(:flatten).try(:first).try(:gsub, ',', '.')

      current_restaurant_general_html =  Nokogiri::HTML open current_restaurant_address_general
      meals_arr = []

      meals_ugly_text = current_restaurant_general_html
        .css('#yd-application-data')
        .to_s
        .scan(/Yd\.predefined\[\"meals\"\](.*?)Yd\.predefined/m)
        .flatten
        .first
        .gsub(';', '')
        .gsub('=', '')

      parsed_meals = JSON.parse(meals_ugly_text)
      # puts parsed_meals.awesome_inspect plain: true

      meals = []
      parsed_meals.try(:each) do |category|
        _meals = category['meals']
        # puts _meals
        _meals.try(:each) do |_meal|
          meal = {
            name: _meal['name'],
            description: _meal['description'].gsub('\n', ' ')
          }
          sizes = []
          _meal['sizes'].try(:each) do |_size|
            sizes.push({
              name: _size['name'],
              cost: _size['cost']
            })
          end
          meal[:sizes] = sizes
          meals.push meal
        end
      end

      # puts meals.awesome_inspect plain: true


      current_hash = restaurants_hash[address_suffix] = {
        meals: meals,
        name: restaurant.css('li.yd-jig-service-dl-info-name').css('a').text.strip,  #nazwa restauracji
        picture: restaurant.css('div.yd-jig-service-dl-logo').css('img').attr('src').to_s[2..-1].strip,  #obrazek
        meal_types: restaurant.css('li.yd-jig-service-dl-info-food').text,  # rodzaje serwowanych potraw
        city: detailed_address.css('span.locality').text.strip,  #miasto
        street: detailed_address.css('span.street-address').text.strip,  #ulica
        zip_code: detailed_address.css('span.postal-code').text.strip, #zip-code
        website: (website_node) ? website_node.attr('href').strip : nil, #strona internetowa
        category: current_restaurant_html.to_s.scan(/"restaurantCategory":"(.*?)"/).flatten[0].strip,
        datetime: current_restaurant_html.css('span[itemprop="openingHours"]').attr('datetime').to_s.split(',').map do |hours|
          tmp = hours.split(' ')
          {tmp[0] => tmp[1].split('-')}
        end,
        delivery_price: delivery_price,
        minimal_delivery_price: minimal_delivery_price,
        free_delivery: free_delivery
      }


      current_hash.merge! Hash[*div_with_detailed_info.css('span.geo.yd-geo-map').css('meta').first.attributes.values.each.map {|x| x.to_s}]  #szerokość geograficzna
      current_hash.merge! Hash[*div_with_detailed_info.css('span.geo.yd-geo-map').css('meta').last.attributes.values.map {|x| x.to_s}]  # długość geograficzna
    end
  end
end

IO.write('/tmp/restauracje_pyszne_pl', restaurants_hash.to_json)
