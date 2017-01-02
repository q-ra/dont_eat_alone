module RestaurantsHelper
  def resized_pyszne_image restaurant
    'http://' << restaurant.picture_address.gsub('155-100', '310-200')
  end
end
