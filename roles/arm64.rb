node.validate! do
  {
      cookbooks: array_of(string)
  }
end

node.reverse_merge!(user: ENV['SUDO_USER'] || ENV['USER'])

include_recipe "../cookbooks/ruby"