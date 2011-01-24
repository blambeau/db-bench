module DbBench
  class Challenger
    
    CHALLENGES = [
      1, 2, 3, 4, 5,
      101, 102, 103, 104, 105,
      201
    ]
    
    def self.inherited(subclass)
      @challengers ||= []
      @challengers << subclass
    end
    
    def self.each
      @challengers.each{|subclass|
        yield(subclass.new) 
      }
    end
    
    def self.run_all_once
      @challengers.each{|subclass|
        puts "Running all_one on #{subclass}"
        challenger = subclass.new
        challenger.run_all_once
      }
    end
    
    def name
      self.class.name.split('::')[1..-1].join('::')
    end
    
    def album_count
      500
    end
    
    def performer_count
      35
    end
    
    def track_count
      5000
    end
    
    def output(*args)
    end
    
    def run_all_once
      setup
      CHALLENGES.each{|i|
        self.send(:"challenge#{i}")
      }
      teardown
    end
    
  end # class Challenger
end # module DbBench