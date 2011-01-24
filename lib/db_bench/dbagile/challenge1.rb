class DbBench::DbAgile::Challenge1 < DbBench::Challenge
  
  def print_all
    DbBench::DbAgile.with_current_connection do |db|
      db.dataset(:performers).each{|perf|
        output("#{perf[:id]}: #{perf[:first_name]} #{perf[:last_name]}")
      }
    end
  end
  
  def run(measures)
    measures[:print_all]  = measure{ print_all }
  end
  
end