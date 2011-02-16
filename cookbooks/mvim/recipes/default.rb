#
# Cookbook Name:: atmos.vim
# Recipe:: default
#

include_recipe "vim"

script "installed macvim from google code" do
  interpreter "bash"
  code <<-EOS
    source ~/.cinderella.profile
    if [ ! -e ~/Developer/bin/mvim ]; then
      rm -rf /Applications/MacVim.app
      curl -L http://github.com/downloads/b4winckler/macvim/MacVim-snapshot-55.tbz -o - | tar xj -
      cd MacVim-snapshot-55
      cp mvim ~/Developer/bin
      cp -r MacVim.app /Applications/
    fi
  EOS
end
