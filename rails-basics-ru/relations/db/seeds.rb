# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

new_status = Status.create(name: 'New')
in_progress = Status.create(name: 'In Progress')
done = Status.create(name: 'Done')
foo = User.create(name: 'Foo')
bar = User.create(name: 'Bar')
bazz = User.create(name: 'Bazz')

Task.create(name: 'First task', description: 'First task description', status: new_status, user: foo)
Task.create(name: 'Second task', description: 'Second task description', status: in_progress, user: bar)
Task.create(name: 'Third', description: 'Third task description', status: done, user: bazz)
