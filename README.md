# Activerecord::AutoDefaults

Sets the default values of nil attributes based on the database schema.

## Installation

Add this line to your application's Gemfile:

    gem 'activerecord-auto_defaults'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activerecord-auto_defaults

## Usage

Given the following code in your application schema:

``` ruby
create_table "articles", :force => true do |t|
  t.string  "title", :limit => 100,  :default => "", :null => false
  t.text    "body",  :limit => 3000, :default => "", :null => false

  t.timestamps
end
```

It may occur that you receive `nil` values for given attributes. Since they are
flagged as `NOT NULL` and have de default value, it should be used to fill the
`nil` attributes.

That's what AutoDefaults is for.

Simply add it to your model:

``` ruby
class Article < ActiveRecord::Base
  include ActiveRecord::AutoDefaults
end
```

And then try to create an article:

``` ruby
Article.create(title: nil, body: nil)
```

You will no longer get a SQL error telling you that a field should not be `NULL`
and as a null value.

This avoids duplicating the schema instructions in a `set_defaults` callback to
set this values before validation.

### Add it to every ActiveRecord model

AutoDefaults provides a generator to use it on any AutoDefaults model.

```
rails generate auto_defaults:install
    create config/initializers/activerecord-auto_defaults.rb
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
