# set :default_env, {
#   'RAILS_ENV' => 'production',
#   'RAILS_MASTER_KEY' => ENV['RAILS_MASTER_KEY']
# }

append :linked_files, 'config/master.key'
