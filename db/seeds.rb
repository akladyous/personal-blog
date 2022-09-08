require 'faker'
Faker::Config.locale= :en

content = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Porro libero nemo repudiandae non, cum, id sed perferendis ad molestiae alias aperiam neque quibusdam voluptatem ratione! Molestiae modi error quod excepturi.' * 5

1.upto(10) do |idx|
  first_name =
  last_name =
  User.create do |user|
    user.first_name =  Faker::Name.first_name
    user.first_name =  Faker::Name.last_name
    user.email = Faker::Internet.unique.email
    user.password = "000000"
    user.password_confirmation = "000000"
    user.save
    2.times do
      user.posts.create do |post|
      post.title = Faker::Book.unique.title
      post.content = Faker::Lorem.unique.paragraph(sentence_count: 90, supplemental: true, random_sentences_to_add: 4)
      post.save
      end
    end
  end
end
