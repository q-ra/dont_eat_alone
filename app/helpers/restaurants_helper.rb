module RestaurantsHelper
  def pyszne_link link
    'http://pyszne.pl/' + link
  end

  def todays_opening_closing restaurant
    days = %w(mo tu we th fr sa su)
    day_number = Time.now.wday.to_i
    opening_closing = restaurant.opening_closing
    opening = opening_closing[days[day_number] + '_opening']
    closing = opening_closing[days[day_number] + '_closing']
    opening << ' - ' << closing
  end

  def range_of_prices restaurant
    cheapest, *_ , most_expensive = restaurant
      .meals.map(&:meal_sizes).flatten.pluck(:cost).sort
    get_pln(cheapest) << ' - ' << get_pln(most_expensive)
  end
end
