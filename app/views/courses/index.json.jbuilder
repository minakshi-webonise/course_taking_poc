json.array!(@courses) do |course|
  json.extract! course, :id, :title, :content
  json.url course_url(course, format: :json)
end
