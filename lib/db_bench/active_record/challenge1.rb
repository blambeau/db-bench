require File.expand_path('../../active_record', __FILE__)

class DbBench::ActiveRecord::Challenge1 < DbBench::Challenge

  def bench_find_all
    Performer.find(:all).each{|perf| 
      output("#{perf.id}: #{perf.first_name} #{perf.last_name}")
    }
  end
  
  def bench_find_each
    Performer.find_each{|perf| 
      output("#{perf.id}: #{perf.first_name} #{perf.last_name}")
    }
  end  
  
  def run(measures)
    measures[:find_all]  = measure{ bench_find_all  }
    measures[:find_each] = measure{ bench_find_each }
  end
  
end
