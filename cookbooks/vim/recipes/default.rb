script "installing http://github.com/carlhuda/janus" do
  interpreter "bash"
  code <<-EOS
    source ~/.cinderella.profile
    if [ ! -d ~/.vim ]; then
      git clone git://github.com/carlhuda/janus.git ~/.vim
      cd ~/.vim
      rake
    elif [ ! -d ~/.vim/Rakefile ]; then
      for i in ~/.vim ~/.vimrc ~/.gvimrc; do [ -e $i ] && mv $i $i.old; done
      git clone git://github.com/carlhuda/janus.git ~/.vim
      cd ~/.vim
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
