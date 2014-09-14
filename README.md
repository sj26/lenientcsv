# LenientCSV

Ruby CSV parser supporting both RFC 4180 double double-quote and unix-style backslash escaping.

## Installation

Add this line to your application's Gemfile:

    gem 'lenientcsv'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lenientcsv

## Usage

```ruby
csv = <<<-EOS
some,fields
in,"a"
"c
\"s""
v",file
EOS

LevientCSV.new(csv).each do |row|
  puts csv.inspect
end

# ["some", "fields"]
# ["in", "a"]
# ["c\n\"s\"\nv", "file"]
```

Only supports feeding in strings at the moment, I'd like to make it lazily consume IO objects, too.

The parser is an enumerable so you can `#select`/`#take`/`#to_a`/etc

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
