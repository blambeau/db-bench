def shell(cmd)
  Process.wait Kernel.spawn(cmd)
end

def create_db(whichone)
  shell %Q{ sudo su postgres -c 'createdb --owner=dbbench --encoding=utf8 dbbench-#{whichone}'   }
  shell %Q{ dba --use=#{whichone} schema:sql-script create | dba --use=#{whichone} sql:send      }
  shell %Q{ dba --use=#{whichone} bulk:import --truncate --csv --type-safe --input=dbagile/data/performers.csv performers }
  shell %Q{ dba --use=#{whichone} bulk:import --truncate --csv --type-safe --input=dbagile/data/albums.csv albums }
  shell %Q{ dba --use=#{whichone} bulk:import --truncate --csv --type-safe --input=dbagile/data/tracks.csv tracks }
end

task :sudo do
  puts "-"*50
  puts "ATTENTION: this command relies on sudo"
  puts "Please provide root password if asked:"
  puts "-"*50
  shell %q{ sudo -v }
end

task :uninstall => :sudo do
  shell %q{ sudo su postgres -c 'dropdb dbbench-activerecord'  }
  shell %q{ sudo su postgres -c 'dropdb dbbench-dbagile'       }
  shell %q{ sudo su postgres -c 'dropuser dbbench'             }
end

task :install => :uninstall do
  shell %q{ sudo su postgres -c 'createuser dbbench --no-superuser --no-createdb --no-createrole' }
  create_db(:activerecord)
  create_db(:dbagile)
end

task :datadump do
  shell %q{ dba bulk:export --csv --type-safe performers --output=dbagile/data/performers.csv }
  shell %q{ dba bulk:export --csv --type-safe albums     --output=dbagile/data/albums.csv     }
  shell %q{ dba bulk:export --csv --type-safe tracks     --output=dbagile/data/tracks.csv     }
end

task :run_all_once do
  require "db_bench"
  DbBench::Challenger::run_all_once
end