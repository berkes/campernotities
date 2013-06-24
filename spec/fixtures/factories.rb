require "factory_girl"

FactoryGirl.define do

  sequence :email do |n|
    "person#{n}@hogwards.edu.uk"
  end

  factory :camping do |f|
    f.name "Beautifull Green"
    f.association :author, :factory => :admin_user

    factory :camping_with_geo do
      f.latitude 51.77802459999999
      f.longitude 5.9757149
    end
  end

  factory :admin_user, :aliases => [:author, :user] do |f|
    f.name "Harry"
    f.email
    f.password "password"
    f.password_confirmation "password"
  end

  factory :label do |f|
    f.name "Amount of places"
    f.value "1-10"
  end

  factory :image do |f|
    f.image File.open(File.join(File.expand_path(File.dirname(__FILE__)), "images", "brown_small.jpg"))
  end
end

