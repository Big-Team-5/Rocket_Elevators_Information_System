    To use the site, each CodeBoxx employees can login with is email and codeboxx1 for password.
    It will grant access to the backoffice dashboard as an super admin...


    Install  Ruby On Rails on Ubuntu
    Install WSL 2
    Clone the repository
        git clone https://github.com/Big-Team-5/Rocket_Elevators_Information_System
        cd Rocket_Elevators_Information_System
    Check your Ruby version
        ruby -v
    The ouput should start with something like ruby 2.5.1
        rvm install 2.5.1
    Install dependencies
    Using Bundler 
        install Bundler
    Configuring Git 
        git config --global color.ui true
        git config --global user.name "YOUR NAME"
        git config --global user.email "YOUR@EMAIL.com"
        ssh-keygen -t rsa -b 4096 -C "YOUR@EMAIL.com"
    Installing Rails
        gem install rails
    Setting Up A Database
        sudo apt-get install mysql-server mysql-client libmysqlclient-dev
    Initialize the database
        rails db:create db:migrate db:seed
    rails server
        rails s
    GEMFILE:
        gem 'devise', '~> 4.7', '>= 4.7.3'
        gem 'rails', '~> 5.2.4', '>= 5.2.4.5'
        gem 'mysql2', '>= 0.4.4', '< 0.6.0'
        gem 'puma', '~> 3.11'
        gem 'sass-rails', '~> 5.0'
        gem 'uglifier', '>= 1.3.0'
        gem 'coffee-rails', '~> 4.2'
        gem 'turbolinks', '~> 5'
        gem 'jbuilder', '~> 2.5'
        gem 'bootsnap', '>= 1.1.0', require: false
    group :development do
        gem 'web-console', '>= 3.3.0'
        gem 'listen', '>= 3.0.5', '< 3.2'
        gem 'spring'
        gem 'spring-watcher-listen', '~> 2.0.0'
        gem 'capistrano', '~> 3.10', require: false
        gem 'capistrano-rails', '~> 1.4', require: false
        gem 'capistrano-bundler', '>= 1.1.0'
        gem 'rvm1-capistrano3', require: false
        gem 'capistrano3-puma'
    end
    group :test do
        gem 'capybara', '>= 2.15'
        gem 'selenium-webdriver'
        gem 'chromedriver-helper'
    end
    gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
    gem 'jquery-rails', '~> 4.4'
    gem "font-awesome-rails" 
    gem 'bootstrap-sass', '~> 3.4.1'
    gem 'sassc-rails', '>= 2.1.0'
    gem 'rails_admin', '~> 2.0'
    gem 'toastr-rails'
    gem 'cancancan' 
>>>>>>> 82e5b005f33d20a08851513f88e3854e5d7bfc95

 ****** WEEK 5 : Using And Mananging Databases ******

1- We added all the new tables in MYSQL with all the required rows and columns in regards to the mandate we had this week. In all, 8 new tables were created in MYSQL. You can see them in our Rails_Admin dashboard by logging in with an email and a password . The tables that needed it were assigned primary keys and foreign keys.

2- Multiples sections in the Rails_Admin dashboard were created in relation to the tables that were asked. You can also edit, delete and see the content of the tables in these menus. The relationships between the objects are all visible in the dashboard tables. New data can be entered/created through the dashboard, as well as the website itself.

3- Data was created from scratch with the help of the Mockaroo app. We used this data to populate the tables you see in MySQL and those you will see in Postgresql. The data is in concordance with what was asked in the "Codeboxx : week 5" file.

4- A data warehouse was created on Postgresql and was also linked to our Rails app to stock the data harvested through MySQL from the website or the dashboard. The data was placed in the 4 tables that were asked in the "Codeboxx week 5" file. With the help of the Whenever and PG gems, the content of these tables is updated in Postgresql every 1.day. The changes from the MySQL DB are refreshed in real time in the 4 Postgresql tables.

5- The data present in the table is then used with two dimensions (time & customers) to be analyzed and returned with the help of the three queries asked in the "Codeboxx week 5" file. The three queries will returned the answer to the three questions asked How many contact requests are made per month? How many bid solicitations are made per month? How many elevators per customer do we have?

**************************** THANKS ****************************
