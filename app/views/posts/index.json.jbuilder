json.array!(@posts) do |post|
  json.extract! post, :id, :title, :decription, :brand, :model, :price
  json.url post_url(post, format: :json)
end
