# frozen_string_literal: true

# rubocop:disable Style/For
# BEGIN
def build_query_string(hash)
  query_params = []
  for key, value in hash.sort do
    query_params << "#{key}=#{value}"
  end
  query_params.join('&')
end
# END
# rubocop:enable Style/For
