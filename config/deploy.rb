set :user, "admin"
set :repository, "git@github.com:chai2/fs_blog.git"
set :scm, :git
set :deploy_to, "/var/www/apps/fashionsprout_blog/"

set :deploy_via, :remote_cache
set :copy_exclude, [".git", ".DS_Store", ".gitignore", ".gitmodules"]

server "staging.fashionsprout.com", :app

task :symlink_config, :except => {:no_release => true, :no_symlink => true} do
  run "ln -nsf #{shared_path}/wp-config.php #{current_release}"
  # run "cd #{release_path} && export PATH=/usr/local/ruby-enterprise/bin:$PATH && bundle install vendor/bundle"
  # run "cd #{release_path}; #{try_sudo} /usr/local/ruby-enterprise/bin/bundle install"
end
