# frozen_string_literal: true

# BEGIN

def get_string_value(num)
  str = ''
  str = "#{str}Fizz" if (num % 3).zero?
  str = "#{str}Buzz" if (num % 5).zero?
  str = "#{str}#{num}" if str.empty?
  str
end

def fizz_buzz(start, stop)
  return nil if stop < start
  result = ''
  current = start
  while current <= stop do
    result += ' ' unless result == ''
    item = get_string_value(current)
    result += item
    current += 1
  end
  result
end
# END
