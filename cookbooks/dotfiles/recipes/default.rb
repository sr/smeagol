if repo = ENV["DOTFILES"]

  dest = "#{ENV["HOME"]}/Developer/dotfiles"

  script "pull down dotfiles" do
    interpreter "bash"
    code <<-EOS
      git clone #{repo} #{dest}
      cd #{dest} && git pull origin master
    EOS

    only_if { !File.directory?(dest) }
  end

  script "symlinks the dotfiles" do
    interpreter "bash"
    cwd dest
    code "rake install"
  end
end
