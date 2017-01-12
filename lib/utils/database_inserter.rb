require 'json'
require 'awesome_print'

def insert_into_database
  hash_with_restaurants = JSON.parse IO.read '/tmp/restauracje_pyszne_pl'

  hash_with_restaurants.each do |restaurant|
    pyszne_address = restaurant[0]
    restaurant = restaurant[1]

    # puts restaurant.awesome_inspect plain: true

    current_restaurant = Restaurant.where(pyszne_address: pyszne_address)
      .first_or_create do |r|
        r.name = restaurant['name']
        r.picture_address = restaurant['picture']
        r.meal_type = restaurant['meal_types']
        r.city = restaurant['city']
        r.street = restaurant['street']
        r.zip_code = restaurant['zip_code']
        r.website = restaurant['website']
        r.category = restaurant['category']
        r.latitude = restaurant['latitude' ]
        r.longitude = restaurant['longitude']
        r.delivery_price = restaurant['delivery_price']
        r.minimal_delivery_price = restaurant['minimal_delivery_price']
        r.free_delivery = restaurant['free_delivery']
        r.image = URI.parse(
          'http://' + restaurant['picture'].gsub('155-100', '310-200')
        )
      end

      restaurant['meals'].each do |_meal|
        meal = Meal.create(
          name: _meal['name'],
          description: _meal['description']
        )

        _meal['sizes'].each do |_size|
          meal_size = MealSize.create(
            name: _size['name'],
            cost: _size['cost']
          )
          meal.meal_sizes << meal_size
        end
        current_restaurant.meals << meal
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
