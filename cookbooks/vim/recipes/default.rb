script "installing http://github.com/carlhuda/janus" do
  interpreter "bash"
  code <<-EOS
    source ~/.cinderella.profile
    if [ ! -d ~/.vim ]; then
      git clone git://github.com/sr/janus.git ~/.vim
      git reset --hard origin/sr
      cd ~/.vim
      rake
    elif [ ! -d ~/.vim/Rakefile ]; then
      for i in ~/.vim ~/.vimrc ~/.gvimrc; do [ -e $i ] && mv $i $i.old; done
      git clone git://github.com/sr/janus.git ~/.vim
      cd ~/.vim
      git reset --hard origin/sr
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
