FactoryBot.define do
    factory :user do
      email { "user@example.com" }
      password { "password" }
      # Add any other fields that are required for a valid user.
      # For example, if your User model validates the presence of a username, add that here.
  
      after(:build) do |user|
        user.skip_confirmation! if user.respond_to?(:skip_confirmation!)
      end
    end
  end
  