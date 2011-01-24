require File.expand_path('../commons', __FILE__)
logto("append")

# 1 transaction blocks 
1.times do |i|

  ActiveRecord::Base.transaction do

    # We build 100 albums
    100.times do |albid|
      albid = i*100 + albid
      album = Album.create(:title     => "The #{albid}-th album", 
                           :performer => "The #{albid}-th performer")

      # with 12 tracks each
      12.times do |trackid|
        album.tracks.create(:track_number => trackid, 
                            :title        => "The #{trackid}-th track")
      end

    end # albums

  end # transaction

end