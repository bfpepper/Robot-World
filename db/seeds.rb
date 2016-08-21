require 'sqlite3'

database = SQLite3::Database.new("db/robot_world_development.db")

#Delete existing records from the robots table before inserting these new records; we'll start from scratch.
database.execute("DELETE FROM robots")

# Insert records.
database.execute("INSERT INTO robots
                  (name, city, state, birthdate, date_hired, department)
                  VALUES
                    ('Troy', 'Bailey', 'Co', '03-14-1987', '3-15-2013', 'account managment'),
                    ('Denton', 'Somewhere', 'NC', '07-15-1988', '3-15-2012', 'sales'),
                    ('Conrad', 'Chicago', 'IL', '08-14-1987', '07-19-2013', 'sales');"
                )

# verifying that our SQL INSERT statement worked
puts "It worked and:"
p database.execute("SELECT * FROM robots;")
