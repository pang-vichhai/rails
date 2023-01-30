FactoryBot.define do
  factory :commenting do
    content { "MyText" }
    article { nil }
    user { nil }
  end
end
