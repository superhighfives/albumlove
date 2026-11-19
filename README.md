# Albumlove

A Rails app I started in 2012 as the base for a social network for sharing albums. It got as far as the [Ruby on Rails Tutorial](https://www.railstutorial.org/) sample app: sign up, sign in, user profiles, and short posts in a feed. The album part never happened.

Status: archived. Made in 2012, not maintained.

## Running it

You'll need Ruby 1.9, Bundler and PostgreSQL. Rails 3.2 and these gem versions won't install on a modern Ruby, so treat this as a reference.

```sh
bundle
bundle exec rake db:create db:migrate
bundle exec rake db:populate   # fake users and posts
bundle exec rails server
bundle exec rspec              # tests, plus cucumber for features/
```

## How it works

- A Rails 3.2 app styled with Bootstrap. Users use `has_secure_password`, and sessions live in `app/helpers/sessions_helper.rb`.
- `User` and `Micropost` are the only models. Routes are in `config/routes.rb`.
- Tests are RSpec in `spec/` and Cucumber in `features/`.
