require File.expand_path('../commons', __FILE__)
Album.find(:all).each do |alb|
  alb.tracks.each do |track|
    "#{track.track_number} #{track.title} #{alb.title}"
  end
end