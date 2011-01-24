require "rubygems"
require "quickl"
require "dbagile"

# 
# Generate data inside the database
#
# SYNOPSIS
#   #{program_name}
#
# OPTIONS
# #{summarized_options}
#
# DESCRIPTION
#   Generates records, according to options
#
class DataGenerator < Quickl::Command(__FILE__, __LINE__)
  
  # Numbers of performers to generate
  attr_accessor :nb_performers
  
  # Numbers of albums to generate
  attr_accessor :nb_albums
  
  # Min number of tracks by album
  attr_accessor :min_tracks
  
  # Max number of tracks by album
  attr_accessor :max_tracks
  
  # Install command options
  options do |opt|
    @nb_performers = 55
    @nb_albums = 500
    @min_tracks = 5
    @max_tracks = 16
  end
  
  def build_performer_tuple(id)
    {:id => id, 
     :first_name => "Performer #{id}'s first name ",
     :last_name  => "Performer #{id}'s last name "}
  end
  
  def build_album_tuple(id)
    {:id           => id,
     :title        => "Album #{id} title",
     :performer_id => Kernel.rand(nb_performers)}
  end
  
  def build_track_tuple(id, album, position)
    {:id       => id,
     :album_id => album,
     :position => position,
     :title    => "Track #{album}::#{position} title",
     :votes    => Kernel.rand(200)}
  end

  # Lauch the command
  def execute(args)
    env = DbAgile.default_environment
    env.with_current_connection do |conn|
      
      # Clean the database
      conn.transaction do |trans|
        trans.delete(:performers)
        trans.delete(:albums)
        trans.delete(:tracks)
      end
      
      # Create nb_performers performers
      nb_performers.times do |id|
        conn.transaction do |trans|
          trans.insert(:performers, build_performer_tuple(id))
        end
      end
      
      # Create nb_albums albums
      track_id = 0
      nb_albums.times do |album|
        conn.transaction do |trans|
          trans.insert(:albums, build_album_tuple(album))
          
          # create tracks now
          (min_tracks + Kernel.rand(max_tracks - min_tracks)).times do |track|
            trans.insert(:tracks, build_track_tuple(track_id, album, track))
            track_id += 1
          end
          
        end
      end
      
    end
  end
  
end # class DataGenerator

if $0 == __FILE__
  DataGenerator.run(ARGV)
end