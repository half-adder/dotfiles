# Git configuration

I store my git credentials in here, but I'm obviously not putting that on github...

If you (for whatever reason) are using this project as the basis for your dotfiles,
make a file called `.git-credentials` or whatever you want to call it, and store
your credentials in it. Then run

    $git config --global credential.helper 'store --file ~/.git-credentials'

make sure to run this AFTER you've symlinked your files into your ${HOME} directory!
