class DbBench::DbAgile::Challenge3 < DbBench::Challenge
  
  SQL = <<-SQL
    SELECT A.id as id, 
           A.title as title,
           P.first_name as first_name,
           P.last_name as last_name
      FROM albums as A INNER JOIN performers as P
        ON A.performer_id = P.id
  SQL
  
  def print_all
    DbBench::DbAgile.with_current_connection do |db|
      db.dataset(SQL).each{|tuple|
        output("#{tuple[:title]} by #{tuple[:first_name]} #{tuple[:last_name]}")
      }
    end
  end
  
  def run(measures)
    measures[:print_all]  = measure{ print_all }
  end
  
end