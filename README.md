# First, we need to clean up any previous Ruby installation you might have:

```
rvm implode && sudo rm -rf ~/.rvm
```

_If you got "command not found: rvm", carry on. It means `rvm` is not
on your computer, which is good_

```
rm -rf ~/.rbenv
```
Then in the terminal, run:
```
sudo apt install -y build-essential tklib zlib1g-dev libssl-dev libffi-dev libxml2 libxml2-dev libxslt1-dev libreadline-dev
sudo apt clean
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
```

Close your terminal and open it again. If you get a warning, just ignore it from now (Ruby is not installed yet).

Now, you are ready to install the latest ruby version and set it as the default version.

Run this command, it will take a while (5-10 minutes)

```
rbenv install 2.6.6
```

Once the ruby installation is done, run this command to tell the system to use the 2.6.6 version by default.

```
rbenv global 2.6.6
```
# Installing Rails

```
gem install rails -v 6.0.3.5
```
