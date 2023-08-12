node.reverse_merge!(user: ENV['SUDO_USER'] || ENV['USER'])

include_recipe "../cookbooks/cask"
include_recipe "../cookbooks/ruby"
include_recipe "../cookbooks/nodejs"
include_recipe "../cookbooks/vscode"