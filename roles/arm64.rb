node.reverse_merge!(user: ENV['SUDO_USER'] || ENV['USER'])

include_recipe "../cookbooks/cask"
include_recipe "../cookbooks/ruby"
include_recipe "../cookbooks/nodejs"
include_recipe "../cookbooks/vscode"

package "mysql@5.7"
command "brew services start mysql@5.7"
command 'which mysql || echo export PATH="/usr/local/opt/mysql@5.7/bin:$PATH" >> ~/.zprofile'

package "redis"
command "brew services start redis"

package "td-agent"
command "launchctl load /Library/LaunchDaemons/td-agent.plist"

package "imagemagick@6"
package "ghostscript"