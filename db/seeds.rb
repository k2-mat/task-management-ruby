# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user = User.new({email: 'user@example.com', password: 'password'})
user.skip_confirmation!
user.save!

user.tasks.create (
  [
    {title: 'title1', body: 'content1'},
    {title: 'title2', body: 'content2'},
    {title: 'title3', body: 'content3'},
    {title: 'title4', body: 'content4'},
    {title: 'title5', body: 'content5'},
    {title: 'title6', body: 'content6'},
    {title: 'title7', body: 'content7'},
    {title: 'title8', body: 'content8'},
    {title: 'title9', body: 'content9'},
    {title: 'title10', body: 'content10'}
  ]
)
