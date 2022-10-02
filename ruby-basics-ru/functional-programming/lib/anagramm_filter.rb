# frozen_string_literal: true

# BEGIN
def anagramm_filter(original_word, check_list)
  letters = original_word.split('').sort
  check_list.filter { |word| letters == word.split('').sort }
end
# END
