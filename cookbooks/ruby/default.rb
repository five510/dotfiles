package 'rbenv'

execute 'install latest ruby' do
    not_if "rbenv global $(rbenv install -L | grep -v - | tail -1)"
    
    command <<~SCRIPT
    rbenv install $(rbenv install -L | grep -v - | tail -1)
    rbenv global $(rbenv install -L | grep -v - | tail -1)
    SCRIPT
end

execute 'install gems' do
    user 'root'

    command <<~SCRIPT
    gem update bundler
    gem install foreman
    SCRIPT    
end