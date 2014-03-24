module Rails
  class <<self
    def root
      File.expand_path("../..", __FILE__)
    end
  end
end
puts Rails.root

rails_env = ENV["RAILS_ENV"] || "development" || "production"

#pidfile "#{Rails.root}/tmp/pids/puma.pid"
#state_path "#{Rails.root}/tmp/pids/puma.state"
#daemonize true
#workers 2
#threads 0,2
#preload_app!


directory Rails.root
environment rails_env
daemonize true
# pids目录必须存在,否则无法启动puma服务
pidfile "#{Rails.root}/tmp/pids/puma.pid"
state_path "#{Rails.root}/tmp/pids/puma.state"
stdout_redirect "#{Rails.root}/log/stdout", "#{Rails.root}/log/stderr"
# quiet
threads 0, 16
bind "unix:///tmp/puma.sock"
# ssl_bind '127.0.0.1', '9292', { key: path_to_key, cert: path_to_cert }

## === Cluster mode ===
workers 2
# after_worker_boot do
#   puts 'On worker boot...'
# end
preload_app!

## http://ruby-china.org/topics/15140
## http://ruby-china.org/topics/10832
## https://raw.githubusercontent.com/puma/puma/master/examples/config.rb
## http://ruby-china.org/topics/1415

# directory '/u/apps/lolcat'
# rackup '/u/apps/lolcat/config.ru'
# environment 'production'
# daemonize false
# pidfile '/u/apps/lolcat/tmp/pids/puma.pid'
# state_path '/u/apps/lolcat/tmp/pids/puma.state'
# stdout_redirect '/u/apps/lolcat/log/stdout', '/u/apps/lolcat/log/stderr'
# quiet
# threads 0, 16
# bind 'unix:///var/run/puma.sock'
# ssl_bind '127.0.0.1', '9292', { key: path_to_key, cert: path_to_cert }

## === Cluster mode ===
# workers 2
# after_worker_boot do
#   puts 'On worker boot...'
# end
# preload_app