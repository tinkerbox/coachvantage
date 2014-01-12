# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :note, :class => 'Notes' do
    caption "MyString"
    content "MyString"
  end
end
