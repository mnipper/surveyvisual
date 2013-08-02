# Getting started

Set your iSurvey Credentials as environment variables.
```
$ export ISURVEY_COMPANY_IDENTIFIER=00000000
$ export ISURVEY_SURVEY_PASSWORD=0000000000
```


Install mongodb:
http://docs.mongodb.org/manual/tutorial/install-mongodb-on-debian-or-ubuntu-linux/

Install redis:
```
$ wget http://redis.googlecode.com/files/redis-2.6.14.tar.gz
$ tar xzf redis-2.6.14.tar.gz
$ cd redis-2.6.14
$ make
```

Start mongo and redis-server.

Install gems in project root:
```
$ bundle install
```

Run sidekiq in project root:
```
$ sidekiq
```

Start the rails server
```
$ rails server
```
