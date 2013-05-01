set :application, "CN_campernotities"
set :repository,  "https://github.com/berkes/campernotities"

set :deploy_to, "/var/www/#{application}"

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "MNC_monica"                          # Your HTTP server, Apache/etc
role :app, "MNC_monica"                          # This may be the same as your `Web` server
role :db,  "MNC_monica", :primary => true # This is where Rails migrations will run

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# Gnome-terminal or Ubuntu or whatever trows errors. No idea what 
# this does, but it fixes the issue. :D
default_run_options[:pty] = true

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
