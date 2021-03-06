# DelayedMailhopper [![Build Status](https://secure.travis-ci.org/cerebris/delayed_mailhopper.png)](http://travis-ci.org/cerebris/delayed_mailhopper)

DelayedMailhopper provides a simple solution to queue, deliver and archive emails in Rails apps. It extends Mailhopper and uses DelayedJob to queue delivery jobs asynchronously.

## Requirements

 * Rails 3.1+
 * DelayedJob
 * Mailhopper

## Installation

Add to your project's Gemfile:

```
gem 'delayed_mailhopper'
```

Install with bundler (note: also installs dependencies such as DelayedJob and Mailhopper):

```
bundle install
```

## Configure Mailhopper

If you haven't already, you'll need to run generators for Mailhopper and then migrate your database.

```
rails g mailhopper
rake db:migrate
```

## Configure DelayedJob

### ActiveRecord Backend

Add the gem to your Gemfile:

```
gem 'delayed_job_active_record'
```

Run the generator to create the migration for the delayed_job table.

```
rails g delayed_job:active_record
rake db:migrate
```

see the README: https://github.com/collectiveidea/delayed_job_active_record

### Mongoid backend

Add the gem to your Gemfile:

```
gem 'delayed_job_mongoid'
```

Create the indexes (and don't forget to do this on your production database):

```
script/rails runner 'Delayed::Backend::Mongoid::Job.create_indexes'
```

see the README: https://github.com/collectiveidea/delayed_job_mongoid

## Troubleshooting

If you've cleared your delayed job queue and need to regenerate jobs for all unsent emails, try the following from your Rails console (`rails c`):

```
DelayedMailhopper::Email.unsent.each { |email| email.enqueue }
```

## References

Please see the README for Mailhopper: https://github.com/cerebris/mailhopper

And for DelayedJob: https://github.com/collectiveidea/delayed_job/

## Copyright

Copyright (c) 2011 Cerebris Corporation. This is free software released under the MIT License (see MIT-LICENSE for details).
