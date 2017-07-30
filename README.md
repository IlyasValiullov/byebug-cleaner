# ByebugCleaner


## Usage
You can remove all byebug tag from source code using rake task:
```bash
rails byebug:clean
```
Default path for clean is [app/*].  Script recursively search byebug tag in files and delete whole line.

Task default create backup files.
Get help for more options:
```bash
rails byebug:clean -- -h
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'byebug-cleaner', github: "IlyasValiullov/byebug-cleaner"
```

And then execute:
```bash
$ bundle install
```


## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
