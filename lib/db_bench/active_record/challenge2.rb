class DbBench::ActiveRecord::Challenge2 < DbBench::Challenge
  
  def find_all
    Track.find(:all).each{|track| 
      output("#{track.id}: #{track.title}")
    }
  end
  
  def find_each
    Track.find_each{|track| 
      output("#{track.id}: #{track.title}")
    }
  end  
  
  def run(measures)
    measures[:find_all]  = measure{ find_all  }
    measures[:find_each] = measure{ find_each }
  end
  
end
