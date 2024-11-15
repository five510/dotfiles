node.reverse_merge!(user: ENV['SUDO_USER'] || ENV['USER'])

include_recipe "../cookbooks/cask"
include_recipe "../cookbooks/ruby"
include_recipe "../cookbooks/nodejs"
include_recipe "../cookbooks/vscode"

package "mysql@8.0"
execute 'setup mysql' do
  not_if "mysql -v"

  command "brew services start mysql@8.0"
  command 'which mysql || echo export PATH="/usr/local/opt/mysql@8.0/bin:$PATH" >> ~/.zprofile'
end

package "redis"
execute 'setup redis' do
  command "brew services start redis"
end

package "td-agent"
execute 'setup td-agent' do
  command "launchctl load /Library/LaunchDaemons/td-agent.plist"
end

package "yarn"
package "imagemagick@6"
package "ghostscript"
package "shared-mime-info"

package "terraform"
package "awscli"
cask "chromedriver"
cask "docker"

cask "iterm2"
cask "alt-tab"
cask "insomnia"
cask "clipy"