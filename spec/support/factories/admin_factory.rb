FactoryGirl.define do
	factory :user do
		sequence(:email){ |n| "user#{n}@email.com"}
		password "password"
		password_confirmation "password"
		role "random"

		factory :confirmed_user do
			after_create do |user|
				user.approval = 1
				user.role = 'random'
				user.save!
			end
		end


		factory :admin_user do
		  after_create do |user|
		    user.approval = 1
		    user.role = 'admin'
		    user.update_attribute(:admin, true)
			end
		end
	end
end
