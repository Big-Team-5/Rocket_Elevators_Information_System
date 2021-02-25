require 'pg'
class FactsController < ApplicationController
    
    helper_method :createtables
    # GET /facts 
    def createtables

        # Initialize connection variables.
        host = String('localhost')
        database = String('gres')
        user = String('sirine')
        password = String('elyas@18')

        # Initialize connection object.
        connection = PG::Connection.new(:host => host, :user => user, :dbname => database, :port => '5432', :password => password)
        puts 'Successfully created connection to database'

        # Drop previous table of same name if one exists
        connection.exec('DROP TABLE IF EXISTS inventory;')
        puts 'Finished dropping table (if existed).'

        # Drop previous table of same name if one exists.
        connection.exec('CREATE TABLE inventory (id serial PRIMARY KEY, name VARCHAR(50), quantity INTEGER);')
        puts 'Finished creating table.'

        # Insert some data into table.
        connection.exec("INSERT INTO inventory VALUES(1, 'banana', 150)")
        connection.exec("INSERT INTO inventory VALUES(2, 'orange', 154)")
        connection.exec("INSERT INTO inventory VALUES(3, 'apple', 100)")
        puts 'Inserted 3 rows of data.'

    rescue PG::Error => e
        puts e.message

    ensure
        connection.close if connection
end