require 'pg'

namespace :connect do

        desc 'Connection Task'
        task dwh: :environment do

            
            conn = PG::Connection.open(:host => 'localhost', :port => 5432, :dbname => 'Dana_Duquette', :user => 'surveytech', :password =>'2304godZ')

            conn.exec 'DROP TABLE IF EXISTS FactQuotes'
            conn.exec('CREATE TABLE FactQuotes (
                QuoteId integer PRIMARY KEY,
                Creation timestamp,
                Company_Name text,
                Email text,
                NbElevator integer
            );')

            QuoteForm.all.each do | q | 
                conn.exec("INSERT INTO dana_duquette.FactQuotes (QuoteId, Creation, Company_Name, Email, NbElevator)
                VALUES ( '#{q.id}', '#{q.created_at}', '#{q.FirstName}',' #{q.Email}', '#{q.Elevators}')")
            end
            #------------------------------------------------------------

            conn.exec 'DROP TABLE IF EXISTS FactContact'
            conn.exec('CREATE TABLE FactContact (
                ContactId integer PRIMARY KEY,
                Creation_Date timestamp,
                Company_Name text,
                Email text,
                Project_Name text
            );')

            # contact = leads.all

            Lead.all.each do | c |
                conn.exec("INSERT INTO dana_duquette.FactContact (ContactId, Creation, Company_Name, Email, Project_Name)
                VALUES ( '#{c.id}', '#{c.created_at}', '#{c.compagny_Name}',' #{c.Email}', '#{c.project_Name}')")
            end
            #------------------------------------------------------------

            conn.exec 'DROP TABLE IF EXISTS FactElevator'
            conn.exec('CREATE TABLE FactElevator (
                SerialNumber text PRIMARY KEY,
                Date_of_commissioning timestamp,
                BuildingId integer,
                CustomerId integer,
                Building_city text
            );')

            # elevators = elevator.all

            Elevator.all.each do | e |
                conn.exec("INSERT INTO dana_duquette.FactElevator (SerialNumber, Date_of_commissioning, BuildingId, CustomerId, Building_city)
                VALUES ( '#{e.id}', '#{e.created_at}', '#{e.compagny_Name}',' #{e.Email}', '#{e.city}')")
            end
            #------------------------------------------------------------

            conn.exec 'DROP TABLE IF EXISTS DimCustomers'
            conn.exec('CREATE TABLE DimCustomers (
                Creation_Date timestamp PRIMARY KEY,
                Company_Name text,
                Full_Name_of_the_company_main_contact text,
                Email_of_the_company_main_contact integer,
                NbElevator integer,
                Customer_city text
            );')

            # custom = customers.all

            Customer.all.each do | t |
                conn.exec("INSERT INTO dana_duquette.DimCustomers (Creation_Date, Company_Name, Full_Name_of_the_company_main_contact, Email_of_the_company_main_contact, NbElevator,Customer_city)
                VALUES ('#{t.created_at}', '#{t.compagny_Name}', '#{t.full_Name_of_the_compagny_contact}',' #{t.email_of_the_compagny_contact}', '#{t.elevators}', '#{t.city}')")
            end

        end
end