module DbBench
  module DbAgile
    class Intuitive < DbBench::Challenger
      include Helpers
      
      def challenge1
        dataset(:performers).each{|perf|
          output(perf[:id], perf[:first_name], perf[:last_name])
        }
      end
      
      def challenge2
        dataset(:tracks).each{|track|
          output(track[:id], track[:title])
        }
      end
      
      def challenge3
        dataset(:challenge3).each{|tuple|
          output(tuple[:title], tuple[:first_name], tuple[:last_name])
        }
      end
  
      def challenge4
        dataset(:challenge4).each{|tuple|
          output(tuple[:title], tuple[:nb_tracks])
        }
      end
  
      def challenge5(id = Kernel.rand(album_count))
        tuple = dataset(:challenge5).where(:id => id).first
        output(tuple[:title], tuple[:nb_tracks])
      end
      
    end # class Intuitive
  end # module DbAgile
end # module DbBench
    