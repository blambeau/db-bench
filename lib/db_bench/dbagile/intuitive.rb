module DbBench
  module DbAgile
    class Intuitive < DbBench::Challenger
      include Helpers
      
      SQL = {
        1 => "SELECT * FROM performers as P",
        2 => "SELECT * FROM tracks as T",
        3 => %q{
          SELECT A.id as id,
                 A.title as title,
                 P.first_name as first_name,
                 P.last_name as last_name
            FROM albums as A
            JOIN performers as P ON A.performer_id = P.id
        },
        4 => %q{
          SELECT A.id as id,
                 A.title as title,
                 (SELECT count(*) FROM tracks WHERE album_id = A.id) as nb_tracks 
            FROM albums as A
        },
        5 => %q{
          SELECT A.id as id,
                 A.title as title,
                 P.first_name as first_name,
                 P.last_name as last_name,
                 (SELECT count(*) FROM tracks WHERE album_id = A.id) as nb_tracks 
            FROM albums as A
            JOIN performers as P ON A.performer_id = P.id
        }
      }
      
      def sql(which, table = nil, id = nil)
        if id.nil?
          SQL[which]
        else
          SQL[which] + " WHERE #{table}.id=#{id}"
        end
      end
      
      def challenge1
        dataset(sql(1)).each{|perf|
          output(perf[:id], perf[:first_name], perf[:last_name])
        }
      end
      
      def challenge2
        dataset(sql(2)).each{|track|
          output(track[:id], track[:title])
        }
      end
      
      def challenge3
        dataset(sql(3)).each{|tuple|
          output(tuple[:title], tuple[:first_name], tuple[:last_name])
        }
      end
  
      def challenge4
        dataset(sql(4)).each{|tuple|
          output(tuple[:title], tuple[:nb_tracks])
        }
      end
  
      def challenge5
        dataset(sql(5)).each{|tuple|
          output(tuple[:title], tuple[:first_name], tuple[:last_name], tuple[:nb_tracks])
        }
      end
      
      def challenge101(id = Kernel.rand(performer_count))
        perf = dataset(sql(1, "P", id)).first
        output(perf[:id], perf[:first_name], perf[:last_name])
      end
      
      def challenge102(id = Kernel.rand(track_count))
        track = dataset(sql(2, "T", id)).first
        output(track[:id], track[:title])
      end
      
      def challenge103(id = Kernel.rand(album_count))
        tuple = dataset(sql(3, "A", id)).first
        output(tuple[:title], tuple[:first_name], tuple[:last_name])
      end
  
      def challenge104(id = Kernel.rand(album_count))
        tuple = dataset(sql(4, "A", id)).first
        output(tuple[:title], tuple[:nb_tracks])
      end
  
      def challenge105(id = Kernel.rand(album_count))
        tuple = dataset(sql(5, "A", id)).first
        output(tuple[:title], tuple[:first_name], tuple[:last_name], tuple[:nb_tracks])
      end
      
      def challenge201(id = Kernel.rand(album_count))
        dataset("SELECT position, title FROM tracks WHERE album_id = #{id}").each{|tuple|
          output(tuple[:position], tuple[:title])
        }
      end
  
    end # class Intuitive
  end # module DbAgile
end # module DbBench
    