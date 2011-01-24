class Album < ActiveRecord::Base
  has_many :tracks
end
class Track < ActiveRecord::Base
  belongs_to :album
end
