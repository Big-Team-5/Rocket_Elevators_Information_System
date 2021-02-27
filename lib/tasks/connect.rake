require 'pg'
desc 'Fact Tables creation in PostgreSql'
namespace :tableCreation do

    desc 'FactQuotes table creation in PostgreSql'
    task factquotes: :environment do

        conn = PG::Connection.open(:host => 'codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com', :port => 5432, :dbname => 'Dana_Duquette', :user => 'codeboxx', :password =>'Codeboxx1!')
        puts "enter in postgreSQL zone"

        conn.exec 'DROP TABLE IF EXISTS FactQuotes'
        conn.exec('CREATE TABLE FactQuotes (
            QuoteId integer PRIMARY KEY,
            Creation timestamp,
            Company_Name varchar(255),
            Email text,
            NbElevator integer
        );')
        puts "FactQuotes table's done"

        QuoteForm.all.each do | q | 
            conn.exec("INSERT INTO FactQuotes (QuoteId, Creation, Company_Name, Email, NbElevator)
            VALUES ( $$#{q.id}$$, $$#{q.created_at}$$, $$#{q.company_name}$$,$$ #{q.Email}$$, $$#{q.Elevators}$$)")
        end
        puts ">>>>> FactQuotes section terminate <<<<<"
    end

        #------------------------------------------------------------

    desc 'FactContact table creation in PostgreSql'
    task factcontact: :environment do

    conn = PG::Connection.open(:host => 'codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com', :port => 5432, :dbname => 'Dana_Duquette', :user => 'codeboxx', :password =>'Codeboxx1!')
    puts "enter in postgreSQL zone"

        conn.exec 'DROP TABLE IF EXISTS FactContact'
        conn.exec('CREATE TABLE FactContact (
            ContactId integer PRIMARY KEY,
            Creation_Date timestamp,
            Company_Name varchar(255),
            Email text,
            Project_Name text
        );')
        puts "FactContact table's done"

        Lead.all.each do | c |
            conn.exec("INSERT INTO FactContact (ContactId, Creation_Date, Company_Name, Email, Project_Name)
            VALUES ( $$#{c.id}$$, $$#{c.created_at}$$, $$#{c.Company_Name}$$,$$ #{c.Email}$$, $$#{c.Project_Name}$$)")
        end
        puts ">>>>> FactContact section terminate <<<<<"

    end
        #------------------------------------------------------------

    desc 'FactElevator table creation in PostgreSql'
    task factelevator: :environment do

    conn = PG::Connection.open(:host => 'codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com', :port => 5432, :dbname => 'Dana_Duquette', :user => 'codeboxx', :password =>'Codeboxx1!')
    puts "enter in postgreSQL zone"

        conn.exec 'DROP TABLE IF EXISTS FactElevator'
        conn.exec('CREATE TABLE FactElevator (
            SerialNumber text PRIMARY KEY,
            Date_of_commissioning date,
            BuildingId integer,
            CustomerId integer,
            Building_city text
        );')
        puts "FactElevator table's done"

        Elevator.all.each do | e |
            conn.exec("INSERT INTO FactElevator (SerialNumber, Date_of_commissioning, BuildingId, CustomerId, Building_city)
            VALUES ( $$#{e.serial_number}$$, $$#{e.date_of_commissioning}$$, $$#{e.column.battery.building.id}$$,$$ #{e.column.battery.building.customer.id}$$, $$#{e.column.battery.building.address.city}$$)")
        end
        puts ">>>>> FactElevator section terminate <<<<<"

    end
        #------------------------------------------------------------
    desc 'DimCustomers table creation in PostgreSql'
    task dimcustomers: :environment do

    conn = PG::Connection.open(:host => 'codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com', :port => 5432, :dbname => 'Dana_Duquette', :user => 'codeboxx', :password =>'Codeboxx1!')
    puts "enter in postgreSQL zone"

        conn.exec 'DROP TABLE IF EXISTS DimCustomers'
        conn.exec('CREATE TABLE DimCustomers (
            Creation_Date timestamp PRIMARY KEY,
            Company_Name text,
            Full_Name_of_the_company_main_contact text,
            Email_of_the_company_main_contact text,
            NbElevator integer,
            Customer_city text
        );')

        Customer.all.each do | t |
            conn.exec("INSERT INTO DimCustomers (Creation_Date, Company_Name, Full_Name_of_the_company_main_contact, Email_of_the_company_main_contact, NbElevator,Customer_city)
            VALUES ($$#{t.created_at}$$, $$#{t.company_Name}$$, $$#{t.full_Name_of_the_company_contact}$$,$$ #{t.email_of_the_company_contact}$$, $$#{t.address_id}$$, $$#{t.address.city}$$)")
        end
        puts ">>>>> DimCustomers section terminate <<<<<"

    end
    desc 'Execute all task for all table creation'
    multitask :initialize => [:factquotes, :factcontact, :factelevator, :dimcustomers]
    puts ">>>>> All tables are now in PostgreSQL <<<<<"
end