module RestaurantsHelper
  def pyszne_link link
    'http://pyszne.pl/' + link
  end

  def todays_opening_closing restaurant, day_number = Time.now.wday.to_i
    days = %w(mo tu we th fr sa su)
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

  def range_of_meal_prices meal, small_devices = false
     costs = meal.meal_sizes.pluck(:cost).sort
     cheapest = costs[0]
     the_most_expensive = costs[-1]

     if cheapest == the_most_expensive
        return get_pln(cheapest)
      else
        if small_devices
          return get_pln(cheapest) + ' +'
        else
          return get_pln(cheapest) + ' - ' + get_pln(the_most_expensive)
        end
      end
  end

  def meal_size_fix_name name
    (name == 'Normal' or name.blank?) ? 'Standardowa porcja' : name
  end

end
