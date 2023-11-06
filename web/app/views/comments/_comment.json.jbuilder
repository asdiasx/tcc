json.extract! comment, :id, :post_id, :body, :created_at, :updated_at
json.url post_comment_url(comment.post, comment, format: :json)
