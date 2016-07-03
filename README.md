# Stronghold

We want to help you to build a better community for living. By contributing on every aspect of your's. Discuss ideas, follow things as they happen and get notified about important announcements.

Development
---

* Ruby version: `>= 2.2.5`

* System dependencies: Be sure to install rails gem globally and have Devkit if needed for your platform.

* Configuration: Set `TEST_KEY` env var to generated string from `rake secret ` also set a `DEV_KEY` to another generated string from `rake secret ` so they can be used on secrets.yml without been shared.

* Database creation: To migrate the database run `rake db:migrate`.

* Database initialization: After migrating the database run `rake db:seed` if you want to have sample data to work with, especially an user.

* Test suite: Execute bundle with rspec `bundle exec rspec`, don't forget to check your style with `rubocop --auto-correct`.

Contributing
---

Tbd

Deployment

* Docker: TBD
