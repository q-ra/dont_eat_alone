require 'json'
def insert_into_database
  hash_with_restaurants = JSON.parse IO.read '/tmp/restauracje_pyszne_pl'
  hash_with_restaurants.each do |restaurant|
    pyszne_address = restaurant[0]
    restaurant = restaurant[1]

    current_restaurant = Restaurant.where(pyszne_address: pyszne_address)
      .first_or_create do |tmp_restaurant|
        tmp_restaurant.name = restaurant['name'],
        tmp_restaurant.picture_address = restaurant['picture'],
        tmp_restaurant.meal_type = restaurant['meal_types'],
        tmp_restaurant.city = restaurant['city'],
        tmp_restaurant.street = restaurant['street'],
        tmp_restaurant.zip_code = restaurant['zip_code'],
        tmp_restaurant.website = restaurant['website'],
        tmp_restaurant.category = restaurant['category'],
        tmp_restaurant.latitude = restaurant['latitude' ],
        tmp_restaurant.longitude = restaurant['longitude'],
        tmp_restaurant.delivery_price = restaurant['delivery_price'],
        tmp_restaurant.minimal_delivery_price = restaurant['minimal_delivery_price'],
        tmp_restaurant.free_delivery = restaurant['free_delivery'],
        tmp_restaurant.image = URI.parse('http://' + restaurant['picture'].gsub('155-100', '310-200'))
      end


    datetime_hash = {}
    restaurant['datetime'].flatten.each { |day| datetime_hash.merge! day}
    current_restaurant.opening_closing = OpeningClosing.create(
      mo_opening: datetime_hash['Mo'][0].to_s,
      mo_closing: datetime_hash['Mo'][1].to_s,
      tu_opening: datetime_hash['Tu'][0].to_s,
      tu_closing: datetime_hash['Tu'][1].to_s,
      we_opening: datetime_hash['We'][0].to_s,
      we_closing: datetime_hash['We'][1].to_s,
      th_opening: datetime_hash['Th'][0].to_s,
      th_closing: datetime_hash['Th'][1].to_s,
      fr_opening: datetime_hash['Fr'][0].to_s,
      fr_closing: datetime_hash['Fr'][1].to_s,
      sa_opening: datetime_hash['Sa'][0].to_s,
      sa_closing: datetime_hash['Sa'][1].to_s,
      su_opening: datetime_hash['Su'][0].to_s,
      su_closing: datetime_hash['Su'][1].to_s
    )
  end
end

class NilClass
  def [] x; end
end

insert_into_database
