module RankHelper
  def most_recent
    "#{request.path}?order=recent"
  end
  
  def highest_price
    "#{request.path}?order=highest-price"
  end
  
  def lowest_price
    "#{request.path}?order=lowest-price"
  end
  
end
