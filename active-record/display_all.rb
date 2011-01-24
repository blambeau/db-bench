require File.expand_path('../commons', __FILE__)

Benchmark.bm(20) do |x|
  Album.find_by_sql("SELECT * FROM albums INNER JOIN tracks ON albums.id = tracks.album_id").each{}
  
  x.report("find_all") {
    logto("find_all")
    Album.find(:all).each{|album| album.tracks.each{|track| 
      "#{album.title} - #{track.track_number}"
    }}
  }
  
  x.report("find_each") {
    logto("find_each")
    Album.find_each{|album| album.tracks.each{|track| 
      "#{album.title} - #{track.track_number}"
    }}
  }
  
  x.report("eager_each") {
    logto("eager_each")
    Album.includes(:tracks).find_each{|album| album.tracks.each{|track| 
      "#{album.title} - #{track.track_number}"
    }}
  }

  x.report("join") {
    logto("join")
    Album.find_by_sql("SELECT * FROM albums INNER JOIN tracks ON albums.id = tracks.album_id").each{|album|
      "#{album.title} - #{album.track_number}"
    }
  }
  
end