class DbBench::DbAgile::Challenge2 < DbBench::Challenge
  
  def print_all
    DbBench::DbAgile.with_current_connection do |db|
      db.dataset(:tracks).each{|track|
        "#{track[:id]} - #{track[:title]}"
      }
    end
  end
  
  def run(measures)
    measures[:print_all]  = measure{ print_all }
  end
  
end