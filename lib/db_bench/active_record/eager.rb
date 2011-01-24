module DbBench
  module ActiveRecord
    class Eager < DbBench::Challenger
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
        Album.includes(:performer).find_each{|album|
          output(album.title, album.performer.first_name, album.performer.last_name)
        }
      end
      
      def challenge4
        Album.includes(:tracks).find_each{|album|
          output(album.title, album.tracks.count)
        }
      end
      
      def challenge5
        Album.includes(:performer, :tracks).find_each{|album|
          output(album.title, album.performer.first_name, album.performer.last_name, album.tracks.count)
        }
      end
      
      def challenge101(id = Kernel.rand(performer_count))
        perf = Performer.find(id)
        output(perf.id, perf.first_name, perf.last_name)
      end
      
      def challenge102(id = Kernel.rand(track_count))
        track = Track.find(id)
        output(track.id, track.title)
      end
      
      def challenge103(id = Kernel.rand(album_count))
        album = Album.includes(:performer).find(id)
        output(album.title, album.performer.first_name, album.performer.last_name)
      end
      
      def challenge104(id = Kernel.rand(album_count))
        album = Album.includes(:tracks).find(id)
        output(album.title, album.tracks.count)
      end
      
      def challenge105(id = Kernel.rand(album_count))
        album = Album.includes(:performer, :tracks).find(id)
        output(album.title, album.performer.first_name, album.performer.last_name, album.tracks.count)
      end
      
      def challenge201(id = Kernel.rand(album_count))
        album = Album.includes(:tracks).find(id)
        album.tracks.each{|track|
          output(track.position, track.title)
        }
      end
      
    end # class Eager
  end # module ActiveRecord
end # module DbBench