require 'faker'
Faker::Config.locale = :en

system('clear')
puts 'How many records ?'
USERS_TO_CREATE = gets.strip.to_i
POSTS_TO_CREATE = USERS_TO_CREATE * 2
LIKES_TO_CREATE = USERS_TO_CREATE * POSTS_TO_CREATE * 5
system('clear')
puts "🌱 Seeding #{USERS_TO_CREATE.to_i} Users ..."

user_progress = ProgressBar.create(title: 'Creating users', total: USERS_TO_CREATE )

folder = Rails.root.join("app/assets/images/avatars")
images = proc { |avatars_folder|
  Dir.entries(avatars_folder).map(&:downcase).reject{ |folder| folder.starts_with? '.'}
}

1.upto(USERS_TO_CREATE) do |idx|
  User.create do |user|
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    email = Faker::Internet.unique.email
    user.first_name = first_name
    user.last_name = last_name
    user.email = email
    user.password = "000000"
    user.password_confirmation = "000000"
    user.avatar.attach(io: File.open("app/assets/images/avatars/#{idx}.jpg"), filename: "#{idx}.jpg" )
    user.save
    user_progress.increment
    # 1.upto(POSTS_TO_CREATE/USERS_TO_CREATE) do
    #   user.posts.create do |post|
    #     post.title = Faker::Book.unique.title
    #     paragraph = Faker::Lorem.unique.paragraph(sentence_count: 90, supplemental: true, random_sentences_to_add: 4)
    #     post.content = "<p>".concat(paragraph).concat("</p>")
    #     post.save
    #     post_progress.increment
    #   end
    end
end

post_progress = ProgressBar.create(title: 'Creating Posts', total: User.count )
User.all.each_with_index do |user, idx|
      title = Faker::Book.unique.title
      paragraph = Faker::Lorem.unique.paragraph(sentence_count: 90, supplemental: true, random_sentences_to_add: 4)
      # image = File.open("app/assets/images/blogs/#{idx+1}.jpeg")
      # blob = ActiveStorage::Blob.create_and_upload!(io: image, filename: "#{idx+1}.jpeg")
      # attachment = ActionText::Attachment.from_attachable(blob)
      body = "<h3>#{title}</h3><p>#{paragraph}</p>"
      # body = "<h3>#{title}</h3>".concat("#{attachment.to_html}").concat("<p>#{paragraph}</p>")
      post = user.posts.new(title: title, content: body)
      post.save
      post_progress.increment
end

like_progress = ProgressBar.create(title: 'Creating Likes', total: User.count*6 )
User.all.each do |user|
  posts_ids = Post.ids
  posts_ids.sample(6).each do |post_id|
    likes = user.likes.new post_id: post_id
    likes.save
  end
  like_progress.increment
end

# blob = ActiveStorage::Blob.create_and_upload!(io: img, filename: '4.jpg')
# blob = ActiveStorage::Blob.create_and_upload!(io: File.open('path/to/a/file'), filename: 'filename')
# attachment = ActionText::Attachment.from_attachable(blob)
# p3 = u1.posts.create!(content: "<div>Sample content with attachment</div><div>#{attachment.to_html}</div>")
