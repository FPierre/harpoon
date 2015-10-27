# https://github.com/javan/whenever
# http://www.sitepoint.com/schedule-cron-jobs-whenever-gem/
# https://github.com/javan/whenever
# http://eewang.github.io/blog/2013/03/12/how-to-schedule-tasks-using-whenever/
# http://serdardogruyol.com/rails-4-cron-jobs-with-whenever/

set :output, { error: 'log/cron_error_log.log', standard: 'log/cron_log.log' }

every 10.minutes do
  rake 'crawler:run'
end
