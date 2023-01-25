class BlogSerializer
  include JSONAPI::Serializer
  attributes :title, :content, :slug
end
