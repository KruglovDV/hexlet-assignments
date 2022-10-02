# frozen_string_literal: true

# BEGIN
def get_versions(ver)
  ver.split('.').map(&:to_i)
end

def compare_versions(ver1, ver2)
  zipped_versions = get_versions(ver1).zip(get_versions(ver2))
  for pair in zipped_versions do
    v1, v2 = pair
    return 1 if v1 > v2
    return -1 if v1 < v2
  end
  0
end
# END
