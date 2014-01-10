# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact do
    salutation "MyString"
    first_name "MyString"
    last_name "MyString"
    gender "MyString"
    birthday "2014-01-09"
    home_addr "MyString"
    mobile "MyString"
    tel_home "MyString"
    tel_office "MyString"
    skype_id "MyString"
    biz_title "MyString"
    company_name "MyString"
    company_addr "MyString"
    interests "MyString"
    life_obj "MyString"
    biz_obj "MyString"
    profile "MyString"
  end
end
