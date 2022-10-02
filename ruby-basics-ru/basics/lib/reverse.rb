# frozen_string_literal: true

# BEGIN
def reverse(str)
  reversed = ''
  for char in str.split '' do
    reversed = "#{char}#{reversed}"
  end
  reversed
end
# END
