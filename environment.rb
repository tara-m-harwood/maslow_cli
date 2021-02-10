require 'pry'
require_relative './maslow.rb'
require_relative './lib/member.rb'
require_relative './lib/post.rb'
require_relative './lib/comment.rb'

## database

require 'sqlite3'

begin

db = SQLite3::Database.open "maslow.db"
db.execute "INSERT INTO Members VALUES ('Echo')"
db.execute "INSERT INTO Members VALUES ('Foxtrot')"
db.execute "INSERT INTO Members VALUES ('Golf')"
db.execute "INSERT INTO Members VALUES ('Hotel')"

rescue SQLite3::Exception => e 
    
    puts "Exception occurred"
    puts e
    
ensure
    db.close if db
end

### execute

runner


#binding.pry
#0