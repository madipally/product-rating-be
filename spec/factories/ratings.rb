FactoryBot.define do
    factory :rating do
      stars { rand(1..5) } # generate a random rating value between 1 and 5
      association :product
    end
  end