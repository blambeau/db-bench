module DbBench
  module ActiveRecord
    class Intuitive < DbBench::Challenger
      include Helpers
      
      def challenge1
        Performer.find_each{|perf| 
          output(perf.id, perf.first_name, perf.last_name)
        }
      end
      
      def challenge2
        Track.find_each{|track| 
          output(track.id, track.title)
        }
      end
      
      def challenge3
        Album.find_each{|album|
          output(album.title, album.performer.first_name, album.performer.last_name)
        }
      end
      
      def challenge4
        Album.find_each{|album|
          output(album.title, album.tracks.count)
        }
      end
      
      def challenge5(id = Kernel.rand(album_count))
        album = Album.find(id)
        output(album.title, album.tracks.count)
      end
      
    end # class Naive
  end # module ActiveRecord
end # module DbBench