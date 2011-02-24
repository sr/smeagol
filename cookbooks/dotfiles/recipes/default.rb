if repo = ENV["DOTFILES"]

  dest = "#{ENV["HOME"]}/Developer/dotfiles"

  script "pull down dotfiles" do
    interpreter "bash"
    code <<-EOS
      test -d #{dest} || git clone #{repo} #{dest}
      cd #{dest} && git pull origin master
    EOS
  end

  script "symlinks the dotfiles" do
    interpreter "bash"
    cwd dest
    code <<-EOS
      for i in `ls`; do
        ln -sf #{dest}/$i ~/.$i
      done
    EOS
  end
end
