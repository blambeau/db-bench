require File.expand_path('../commons', __FILE__)
100.times do |albid|
  album = Album.create(:title => "The #{albid}-th album", :performer => "The #{albid}-th performer")
  12.times do |trackid|
    album.tracks.create(:track_number => trackid, :title => "The #{trackid}-th track")
  end
end
