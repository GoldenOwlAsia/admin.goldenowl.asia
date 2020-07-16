# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do |i|
  Post.create!(
    title: "title#{i + 1}",
    content: "content#{i + 1}",
    created_at: DateTime.now,
    updated_at: DateTime.now,
    image_file_name: '99320213_243405790265492_9088409282352775168_n.jpg',
    image_content_type: 'image/jpeg',
    image_file_size: 41_432,
    image_updated_at: DateTime.now,
    source: '',
    post_type: '',
    slug: "title#{i + 1}"
  )
end
