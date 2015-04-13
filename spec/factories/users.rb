 FactoryGirl.define do
  factory :user do
    email 'test@example.com'
    password 'f4k3p455w0rd'
    confirmed_at: { Time.zone.now}
   # user = FactoryGirl.create(:user)
   # login_as(user, :scope => :user)
    # if needed
    # is_active true
  end
end