script "installing http://github.com/carlhuda/janus" do
  repo  = ENV["JANUS_REPO"] || "git://github.com/carlhuda/janus.git"
  ref   = ENV["JANUS_REF"]  || "origin/master"

  interpreter "bash"
  code <<-EOS
    source ~/.cinderella.profile
    if [ ! -d ~/.vim ]; then
      git clone #{repo} ~/.vim
      cd ~/.vim
      git reset --hard #{ref}
      rake
    elif [ ! -d ~/.vim/Rakefile ]; then
      for i in ~/.vim ~/.vimrc ~/.gvimrc; do [ -e $i ] && mv $i $i.old; done
      git clone #{repo} ~/.vim
      cd ~/.vim
      git reset --hard #{ref}
      rake
    fi
  EOS
end

directory "#{ENV['HOME']}/.vimswap" do
  action 'create'
end

template "#{ENV['HOME']}/.vimrc.local" do
  source "dot.vimrc.erb"
end

template "#{ENV['HOME']}/.gvimrc.local" do
  source "dot.vimrc.erb"
end
