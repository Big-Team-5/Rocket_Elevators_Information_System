# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
 set :output, "/path/to/my/cron_log.log"
 every 1.day, at: '8:30 am' do
    runner "MyModel.task_to_run_at_eight_thirty_in_the_morning"
  end
  