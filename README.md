# Useful Logs

A collection of good practices to handle rails logs

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'useful_logs'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install useful_logs
```

## Usage

Add to your `ApplicationController`:

```ruby
class ApplicationController < ActionController::Base
  include UsefulLogs::RegisterRequestInfo
end
```

To customize or add values to the logs, you can extend the class `RequestInfo`,
the important part here is to extend the method `MyRequestInfo.field_ids` and
call `super` within, for the new fields to be picked up.

```ruby
class MyRequestInfo < UsefulLogs::RequestInfo
  def self.field_ids
    super.concat(%I(app_install_id))
  end

  def app_install_id
    headers['HTTP_X_APP_INSTALL_IDENTIFIER']
  end
end
```

Another recommended setup in your `config/application.rb` file:

```ruby
module MyApp
  class Application < Rails::Application
    config.log_level = ENV.fetch('RAILS_LOG_LEVEL', :debug).to_sym
    config.log_tags  = [:uuid]
  end
end
```

The final step is to configure lograge in `config/initializer/useful_logs.rb`,
using your custom implementation of `RequestInfo`, in this case
`MyRequestInfo`:

```ruby
UsefulLogs.configure do |config|
  config.request_info_class_name = 'MyRequestInfo'
end

UserHub::Application.configure do
  config.lograge.enabled = true
  config.lograge.custom_options = lambda do |event|
    options = { mark: 'request' }
    MyRequestInfo.field_ids.each_with_object(options) do |field, data|
      data[field] = event.payload[field]
    end
  end
  config.lograge.formatter = lambda do |data|
    UsefulLogs::LogFormatter.key_value_pairs(data)
  end
end
```

## Contributing

Contribution directions go here.

## License

The gem is available as open source under the terms of the [MIT
License](http://opensource.org/licenses/MIT).
