json.extract! notification, :id, :message, :created_at, :updated_at
json.url notification_url(notification, format: :json)
