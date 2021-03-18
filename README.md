_Please refer to Rails installation guide below if Ruby or Rails is not installed in your computer._

Models and DB schema:

![schema](https://user-images.githubusercontent.com/46629749/111673994-4c809100-87fa-11eb-9d0b-6aca6957dc57.jpeg)

The API consists of a Connector ```app/services/connector``` which handles the HTTP request to fetch the ```file.txt``` from the increase-transactions API.

An Adapter ```app/adapters``` then handles the response and writes the file with which the API populates the DB according to the bytes size specifications provided.

The API makes use of the [Interactor gem](https://github.com/collectiveidea/interactor)  to chain processes and organize them in a nice way.

The PaymentBuilder ```app/builder``` processes the ```file.txt``` in chunks that will be passed to the **Interactor Organizer** ```app/interactors``` which will create and save each instance of the models detailed above.


# Execution:
You need Postgresql. Run ```sudo apt install -y postgresql postgresql-contrib libpq-dev build-essential
sudo -u postgres psql --command "CREATE ROLE `whoami` LOGIN ```

Run ```bundle install``` to install all dependencies.
Run ```rails db:create && rails db:migrate``` to create database.

After that is done, run ```rails s``` to start a local server.

This API has 3 main endpoints and 2 admin endpoints to populate and reset the DB.

Clients endpoints:

```/api/v1/clients```
```/api/v1/clients/:client_id/payment_transactions```
```/api/v1/clients/:id```

Admin endpoints:

```/api/v1/admin/seed```
```/api/v1/admin/reset```

You can populate the DB running ``` curl -s http://localhost:3000/api/v1/admin/seed | jq```

Likewise, you can reach the other endpoints altering the request url with the patterns described above.

**IMPORTANT** The increase-transactions API seems to limit the amount of requests in a given time, so the seed will likely not run completely. For demo purposes, you can still access the endpoints to fetch the data that was processed before the API started returning ```500 Internal Server Errors```

# Things I would improve

There sure is a better way to communicate with the API.

I'm not sure if the goal was to persist data but I didn't want to delay the presentation.

I would definitely change the way the HTTP requests are made to better handle timeouts/errors.

I didn't know how to handle the 500 Internal Server errors but they lead me to think that I should fetch the file.txt once and then consult Client data on demand rather than building the whole DB at once and hitting the Client endpoint many times in a short period of time.

I also wanted to host the API on Heroku to avoid running it on local host, but the Heroku service seemed to be down at the moment and was not letting me push to Heroku master.


# Ruby / Rails installation

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
