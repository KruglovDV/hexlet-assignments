# frozen_string_literal: true

# BEGIN
def count_by_years(users)
  man = users.filter { |user| user[:gender] === 'male' }
  man.reduce({}) do |grouped_users, user|
    year = user[:birthday].split('-').first
    grouped_users[year] ||= 0
    grouped_users[year] += 1
    grouped_users
  end
end
# END
