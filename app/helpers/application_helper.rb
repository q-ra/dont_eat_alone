module ApplicationHelper
  def get_pln price
    (price / 100.0).to_s.gsub(/\.0$/, ' ') + ' zł'
  end
end
