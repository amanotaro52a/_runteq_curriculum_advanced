require File.expand_path(File.dirname(__FILE__) + '/environment')
# cronを実行する環境変数周りの設定
ENV.each { |k, v| env(k, v) }
rails_env = ENV['RAILS_ENV'] || :development
# cronを実行する環境変数をセット
set :environment, rails_env
# cronのログの吐き出し場所
set :output, "#{Rails.root}/log/cron.log"
# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
every 1.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
  rake 'article_state:update_article_state'
end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
