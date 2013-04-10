# RailsAdminDataQuality

This gem adds a view to RailsAdmin for all Models that use DataQualityTests.
It displays the state of all quality tests and you can enable/disable tests for certain instances of the model.

## Installation

Add this line to your application's Gemfile:

    gem 'rails_admin_data_quality'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails_admin_data_quality

## Usage

To use the view you will have to enable it in `/config/initializers/rails_admin.rb`.

```ruby
RailsAdmin.config do |config|
  ...
  config.actions do
    ...
    data_quality_view
  end
  ...
end
```

After you have done this restart your application and have fun!
