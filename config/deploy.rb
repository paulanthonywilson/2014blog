set :application, "paulblog"
set :domain, "merecomp@merecomplexities.com"
set :deploy_to, "/home/merecomp/apps/paulblog"
set :repository, "git@github.com:paulanthonywilson/2014blog.git"
set :skip_scm, false
set :ssh_flags, "-A"
set :revision, 'head'


namespace :vlad do

  # clear out everything currently in update_symlinks
  Rake.clear_tasks('vlad:update_symlinks')

  task :update_symlinks do
    # nothing
  end

  task :update do
    c = []
    c << "cd #{release_path}"
    c << "bundle install"
    c << "bundle exec jekyll build"
    run c * " && "
  end

end


