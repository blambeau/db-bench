class DbBench::ActiveRecord::Challenge3 < DbBench::Challenge
    
  def intuitive
    Album.find_each{|album|
      "#{album.title} by #{album.performer.first_name}, #{album.performer.last_name}"
    }
  end  
    
  def eager
    Album.includes(:performer).find_each{|album|
      "#{album.title} by #{album.performer.first_name}, #{album.performer.last_name}"
    }
  end  
    
  def run(measures)
    measures[:intuitive] = measure{ intuitive }
    measures[:eager]     = measure{ eager     }
  end
  
end
