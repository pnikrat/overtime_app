FactoryGirl.define do
  sequence :email do |n|
    "test#{n}@test.com"
  end

  factory :user do
    first_name 'Jon'
    last_name 'Snow'
    email { generate :email }
    password 'foobar'
    password_confirmation 'foobar'

    factory :user_with_posts do
      after(:create) do |user|
        # use build_stubbed instead of create when you dont use User.first,
        # User.last.posts_path etc. in specs (ActiveRecord methods)
        create(:post, user: user)
        create(:second_post, user: user)
      end
    end
  end

  factory :admin_user, class: 'AdminUser' do
    first_name 'Admin'
    last_name 'User'
    email { generate :email }
    password 'foobar'
    password_confirmation 'foobar'
  end
end
