# Sequel::I18n

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/sequel/i18n`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sequel-i18n', github: 'sven199109/sequel-i18n'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sequel-i18n

## Usage

In your locales yaml file, like below(`zh_cn.yml`):

```ruby 
sequel: &sequel
  user:                        
    attributes:                
      name: '用户名'
      email: '邮箱'            
      password: '密码'         
  errors:
    includes: "不在%{arg}内"   
    joiner: " 和 "             
    blank: "不能为空"          
    format: "格式不正确"
    presence: "不能为空"       
    type: "不是一个%{arg}"     
    min_length: "最短为%{arg}" 

zh_cn:
  <<: *sequel
``` 

In padrino, add this to `config/boot.rb`.

```ruby 
Padrino.after_load do
  Sequel::I18n::Validation.load
end
```
Then, enjoy it!

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/sequel-i18n. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

