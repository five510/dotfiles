node.validate! do
{
    cookbooks: array_of(string)
}
end

node.reverse_merge!(user: ENV['SUDO_USER'] || ENV['USER'])

node[:cookbooks].each { |c| include_cookbook c }