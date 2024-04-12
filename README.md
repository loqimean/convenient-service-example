# Just example how to use a gem `convenient_service`

## Usage:
run:
```bash
irb -r ./main.rb
```
then:
```ruby
res = Main.calculate(5)
res.success?
res.data[:formatted_sum]
```
