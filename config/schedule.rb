# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
 set :output, "log/cron.log"
 set :chronic_options, hours24: true

# By default this would run the job every day at 3am
every 1.day, at: '10:04' do
  rake "tableCreation:dwh"
  puts "test **********************************"
end
  