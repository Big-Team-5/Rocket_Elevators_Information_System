require 'faker'
require 'json'

employee_list = [
  {
    first_name: "Nicolas",
    last_name: "Genest",
    title: "CEO",
    email: "nicolas.genest@codeboxx.biz"
  },
  {
    first_name: "Nadya",
    last_name: "Fortier",
    title: "Director",
    email: "nadya.fortier@codeboxx.biz"
  },
  {
    first_name: "Martin",
    last_name: "Chantal",
    title: "Director Assistant",
    email: "martin.chantal@codeboxx.biz"
  },
  {
    first_name: "Mathieu",
    last_name: "Houde",
    title: "Captain",
    email: "mathieu.houde@codeboxx.biz"
  },
  {
    first_name: "David",
    last_name: "Boutin",
    title: "Engineer",
    email: "david.boutin@codeboxx.biz"
  },
  {
    first_name: "Mathieu",
    last_name: "Lortie",
    title: "Engineer",
    email: "mathieu.lortie@codeboxx.biz"
  },
  {
    first_name: "Thomas",
    last_name: "Carrier",
    title: "Engineer",
    email: "thomas.carrier@codeboxx.biz"
  },
]

puts "Seed Started"
######################################################


employee_list.each do |employee|
  user = User.create!(
    email: employee[:email],
    password: "codeboxx1",
    emploiye_role: true,
    user_role: false
  )
  employee = Employee.create!(
    first_name: employee[:first_name],
    last_name: employee[:last_name],
    title: employee[:title],
    email: employee[:email],
    user: user
  )
end

puts "#{Employee.count} employees created"

puts "####################LEADS######################"
300.times do
    lead = Lead.create(
        Full_Name: Faker::Name.name,
        Company_Name: Faker::Company.unique.name,
        Email: Faker::Internet.email,
        Phone: Faker::PhoneNumber.phone_number,
        Project_Name: Faker::Appliance.brand,
        Project_Description: Faker::Lorem.sentences(number: 1, supplemental: true),
        Department_In_Charge: Faker::Company.industry,
        Message: Faker::Lorem.paragraphs(number: 1), 
        created_at: Faker::Time.between_dates(from: Date.today - 1, to: Date.today - 1000, period: :all),
    )
    puts lead.inspect
end


puts Dir.pwd
file = File.read(Dir.pwd+'/addresses.json')
jsonData = JSON.parse(file)

addressStatus = ["Active", "Inactive"]
addressNotes = ["notes about building and customer", "note about customer", "note about client" ]
addressType = ["Billing", "Shiping", "Home", "Business"]

puts "####################ADDRESSES######################"
jsonData["addresses"].each do |address| 
  at = rand(0..3)
  as = rand(0..1)
  an = rand(0..2)
  _address = Address.create(
      type_of_address: addressType[at],
      status: addressStatus[as],
      number_and_street:  address["number_and_street"],
      suite_or_apartment:address["suite_or_apartment"],
      city: address["city"],
      postal_code:address["postal_code"],
      country:address["country"],
      notes: addressNotes[an],
      entity: Faker::Company.unique.name
  )
  
  _address.save!
  puts _address.inspect
  puts address
end

puts "####################USERS######################"
p "users:"
100.times do
    user = User.create!(
        email: Faker::Internet.email,
        encrypted_password: Faker::Crypto.md5 ,
        password: "test1234",      
    )
    
    #user.skip_confirmation!
    user.save!
   
    puts user.inspect
end

puts "####################EMPLOYEE######################"
users = User.take(100);
puts users[0].id.inspect
p "employee:"
100.times do
    index = rand(0..49)
    employee= Employee.create(
        first_name: Faker::Name.first_name,
        title: Faker::Job.title,
        last_name: Faker::Name.last_name,
        user_id: users[index].id
    )
    employee.save!
    puts employee.inspect
end 


#seeding the quote table
puts "*** insert quote:"
elevatorQualityPrice = [123,4000, 304040]
100.times do
    l = rand(0..2)
    quote= QuoteForm.create(
        FirstName: Faker::Name.first_name,
        PhoneNumber: Faker::PhoneNumber.phone_number,
        LastName: Faker::Name.last_name,
        Elevators: Faker::Number.between(from: 1, to: 12),
        Total_Price: Faker::Number.decimal(l_digits: 3, r_digits: 3),
        Price_Per_Unit: elevatorQualityPrice[l],
        Installation_Fees: Faker::Number.decimal(l_digits: 3, r_digits: 3),
        Email: Faker::Internet.email
    )
    quote.save!
    puts quote.inspect
end

puts "Insert customer:"
quote = QuoteForm.take(5)
address = Address.take(10)
100.times do
    index = rand(0..40)
    quoteindex = rand(0..4)
    ad = rand(0..9)
    puts address[ad].inspect
    customer = Customer.create(
      company_Name: Faker::Company.unique.name,
      company_headquarter_address: address[ad].number_and_street,
      full_Name_of_the_company_contact: Faker::Name.name,
      email_of_the_company_contact: Faker::Internet.email,
      company_contact_number: Faker::PhoneNumber.phone_number,
      company_description: Faker::IndustrySegments.super_sector,
      full_name_of_the_technical_authority: Faker::Name.name,
      technical_manager_email_for_service: Faker::Internet.email,
      technical_authority_phone_for_service: Faker::PhoneNumber.phone_number,
      created_at: Faker::Time.between_dates(from: Date.today - 1, to: Date.today - 1000, period: :all),
      # updated_at:
      user_id: users[index].id,
      quote_form_id: quote[quoteindex].id,
      address_id: address[ad].id
    )
    
    customer.save!
     
    puts customer.inspect
   
end   

puts "####################BUILDINGS######################"
customer = Customer.take(50)
 100.times do
    index = rand(0...19)
    building = Building.create(
      full_name_building_administrator: Faker::Name.name,
      email_building_administrator: Faker::Internet.email,
      phone_number_building_administrator: Faker::PhoneNumber.phone_number,
      full_name_technical_contact_for_the_building: Faker::Name.name,
      technical_contact_email_building: Faker::Internet.email,
      technical_contact_phone_building: Faker::PhoneNumber.phone_number,
      customer_id: customer[index].id
    )
    building.save!
   
    puts building.inspect
    
  end

  puts "####################BUILDING_DETAILS######################"
information = ["Residential, built in 1985", "Commercial, built in 2000", "Corporate, built in 2001", "Hybrid, bult in 1998"]
valeur = ["Residential, 2004 for 150.000$", "Commercial, 2008 for 20.000.000$, ", "Corporate, 2010 for 17.000.000$ "]
building = Building.take(20)
100.times do
    build = rand(0..3)
    inf = rand(0..3)
    val = rand(0..2)
    buildingDetail = BuildingDetail.create(
        information_key: information[inf],
        value: valeur[val],
        buildingId: building[build].id
    )
    buildingDetail.save!
    puts buildingDetail.inspect  
    
end

#seeding the batterries table
buildType = ["Residential", "Commercial", "Corporate", "Hybrid"]
batteryStatus = ["On", "Off"]
batteryNnotes = ["Defective", "Good for use"]
batteryInformation = ["Made in USA", "New battery", "Made in Canada", "Old battery"]
building = Building.take(20)
employee = Employee.take(20)
100.times do
    btype = rand(0..3)
    bs = rand(0..1)
    bn = rand(0..1)
    build = [*1..20]
    binf = rand(0..3)
    emp = rand(0..19)
    puts "####################BATTERIES######################"
    batteries = Battery.create(
        building_type: buildType[btype],
        status: batteryStatus[bs],
        date_of_commissioning: Faker::Date.between_except(from: 3.year.ago, to: 1.year.from_now, excepted: Date.today),
        date_of_last_inspection: Faker::Date.between_except(from: 3.year.ago, to: 1.year.from_now, excepted: Date.today),
        certificate_of_operations: Faker::SouthAfrica.vat_number,
        information: batteryInformation[binf],
        notes: batteryNnotes[bn],
        
        building_id: build.delete(build.sample),  
    )
    batteries.save!
    puts batteries.inspect
    #seeding the columns table
    if batteries.persisted?
      buildingType = ["Residential", "Commercial", "Corporate"]
      columnStatus = ["In service" , "Out of serveice"]
      columnInformation = ["Brand new", "old", "Made in US", "Made in Canada"]
      colunmNotes = ["Defective", "Good for use"]
      
      rand(1..10).times do
          bt = rand(0..2)
          cols = rand(0..1)
          colInf=rand(0..3)
          colN = rand(0..1)
          puts "####################COLUMNS######################"
          columns = Column.create(
            building_type: buildingType[bt],
            number_of_floors_served: Faker::Number.between(from: 1, to: 20),
            status: columnStatus[cols],
            information: columnInformation[colInf],
            notes: colunmNotes[colN],
            battery_id: batteries.id
          )    
          columns.save!
          puts columns.inspect
          #seeding the elevators table
          if columns.persisted?
            puts "####################ELEVATORS######################"
            elevatorModel =["Standard", "Premium", "Excelium"]
            buildingType = ["Residential", "Commercial", "Corporate"]
            elevatorStatus = ["Idle", "Moving"]
            elevatorInformation = ["Brand new", "old", "Made in US", "Made in Canada", "in service since 4 years"]
            elevatorNotes = ["Out of service", "To be checked in a week", "The last inspection was successfull"]
            rand(1..10).times do
                eli = rand(0..2)
                build = rand(0..2)
                ele = rand(0..1)
                aa = rand(0..4)
                ab = rand(0..2)
                Elevator.create(
                  serial_number: Faker::Alphanumeric.alphanumeric(number: 10, min_alpha: 3, min_numeric: 3),
                  model: elevatorModel[eli],
                  building_type:  buildingType[build],
                  status: elevatorStatus[ele],
                  date_of_commissioning: Faker::Date.between_except(from: 3.year.ago, to: 1.year.from_now, excepted: Date.today),
                  date_of_last_inspection: Faker::Date.between_except(from: 3.year.ago, to: 1.year.from_now, excepted: Date.today),
                  certificate_of_inspection: Faker::SouthAfrica.vat_number,
                  information: elevatorInformation[aa],
                  notes: elevatorNotes[ab],
                  created_at: Faker::Time.between_dates(from: Date.today - 1, to: Date.today - 1000, period: :all), 
                  # updated_at
                  column_id: columns.id


                    
      
                )
                
            end
        end
      
    end
      

  end

    
end
#####################################################
puts "Seed Ended"