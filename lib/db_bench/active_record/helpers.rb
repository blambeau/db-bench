module DbBench
  module ActiveRecord
    
    class Performer < ::ActiveRecord::Base
      has_many :albums
    end
    
    class Album < ::ActiveRecord::Base
      belongs_to :performer
      has_many :tracks
    end
    
    class Track < ::ActiveRecord::Base
      belongs_to :album
    end
    
    module Helpers
      
      def setup
        config = {
          adapter:  "postgresql",
          database: "dbbench-activerecord",
          username: "dbbench",
          password: "dbbench",
          host:     "localhost"
        }
        ::ActiveRecord::Base.establish_connection(config)
        ::ActiveRecord::Base.logger = nil
      end
      
      def teardown
      end
      
    end

  end # module ActiveRecord
end # module DbBench