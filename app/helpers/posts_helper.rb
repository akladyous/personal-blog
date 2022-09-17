module PostsHelper

  def time_to_read(post)
    average_words_per_minute = 200.00
    content = post.content.body.to_plain_text.split(' ')
    word_count = content.split(' ').count
    average = (word_count / average_words_per_minute).ceil
  end
end
