# insert middleware to allow cross-origin requests
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  if Rails.env.development?
    allow do
      origins "*"
      resource "*", headers: :any, methods: :any
    end
  end
end
