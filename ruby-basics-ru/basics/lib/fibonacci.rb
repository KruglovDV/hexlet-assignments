# frozen_string_literal: true

# BEGIN
def fibonacci(num)
  return nil if num.negative?
  return 0 if num.zero?

  counter = 0
  first = 0
  second = 1
  while counter < num
    first, second = second, first + second
    counter += 1
  end
  first
end
# END
