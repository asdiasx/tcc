class NewCommentWorker
  include Sidekiq::Worker

  def perform(post_title, comment_id)
    puts "===================="
    puts "Start of job: #{jid}"
    puts "Doing hard work that takes 2 seconds to finish"
    puts "Título do post: #{post_title}"
    puts "===================="
    sleep 5
    Notification.create(message: "#{jid} - Post #{post_title} received a new comment - Id: #{comment_id}.")
    puts "Enf of job: #{jid}"
    puts "===================="
  end
end
