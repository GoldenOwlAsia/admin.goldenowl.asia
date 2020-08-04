json.extract! activity, :id, :title, :content, :category, :start_day, :end_day, :slug, :created_at, :updated_at
json.url activity_url(activity, format: :json)
