# frozen_string_literal: true

# BEGIN
def get_same_parity(numbers)
  return [] if numbers.empty?
  is_first_even = numbers.first.even?
  numbers.filter { |num| is_first_even ? num.even? : num.odd? }
end
# END
