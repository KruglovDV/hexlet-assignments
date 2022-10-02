# frozen_string_literal: true

require 'csv'

namespace :hexlet do
  desc 'Loads users from CSV'
  task :import_users, [:file_path] => :environment do |_t, args|
    file_path = args[:file_path]

    unless file_path
      puts 'path to file required!'
      return
    end

    unless File.exists?(file_path)
      puts 'file not found!'
      return
    end

    CSV.foreach(file_path, headers: true) do |row|
      User.create!({ **row.to_h, birthday: Date.strptime(row[2], '%m/%d/%Y') })
    end
  end
end

