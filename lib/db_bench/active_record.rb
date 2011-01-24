require 'active_record'

# Connection config
config = {
  adapter:  "postgresql",
  database: "dbbench-activerecord",
  username: "dbbench",
  password: "dbbench",
  host:     "localhost"
}
ActiveRecord::Base.establish_connection(config)
ActiveRecord::Base.logger = nil

class Performer < ActiveRecord::Base
  has_many :albums
end
class Album < ActiveRecord::Base
  belongs_to :performer
  has_many :tracks
end
class Track < ActiveRecord::Base
  belongs_to :album
end

module DbBench
  module ActiveRecord
  end
end
require "db_bench/active_record/challenge1"
require "db_bench/active_record/challenge2"
require "db_bench/active_record/challenge3"
require "db_bench/active_record/challenge4"
