# README

This is summary for coding-on-rails test. This submission is [INCOMPLETE](#not-yet-done-list).

## Version
Version of software being used during development:
- ruby 2.7.2
- Rails 5.2.4.4
- Ubuntu 18.04.5 LTS

## Need to be listed
- [Postman Documentation](https://documenter.getpostman.com/view/8400891/TW76E5Uo#43ebe50c-6b03-4341-a1cc-179d4974c7c1)
- Additional gem:
    - jwt: for authentication & authorization
    - active_model_serializers: to convert attributes from snake_case to camelCase 
    - rspec-rails: for unit test
    - shoulda-matchers: support unit test implementation
- References:
    - [Initial Server Setup with Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-18-04)
    - [How To Install Ruby on Rails with rbenv on Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-18-04)
    - [Build a RESTful JSON API With Rails 5](https://www.digitalocean.com/community/tutorials/build-a-restful-json-api-with-rails-5-part-one)
    - [Authentication and Authorization](https://scotch.io/tutorials/build-a-restful-json-api-with-rails-5-part-two)
    - [Creating a REST API with Rails](https://medium.com/@oliver.seq/creating-a-rest-api-with-rails-2a07f548e5dc)

## Not Yet Done List
- using Enumeration for project type
- unit test for controller

## How to Get It Run
This step assumes unix-based machine is ready. Clone [this repository](https://github.com/veryresto/coding-on-rails.git)
```bash
$ git clone https://github.com/veryresto/coding-on-rails.git
```

Go to downloaded folder
```bash
$ cd coding-on-rails
```

Install the gems
```bash
$ bundle install
```

Run the migrations
```bash
$ rails db:migrate
```


(Optional) Run the tests
```bash
$ bundle exec rspec
```

Run the server. By default it will run on http://localhost:3000
```bash
$ rails s
```
