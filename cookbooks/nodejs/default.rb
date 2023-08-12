package 'nodebrew'

execute 'install latest ruby' do
    not_if "ls $HOME/.nodebrew/current/bin/nodebrew"
    
    command <<~SCRIPT
    nodebrew setup
    echo 'export PATH=$HOME/.nodebrew/current/bin:$PATH' >> ~/.zprofile
    SCRIPT
end