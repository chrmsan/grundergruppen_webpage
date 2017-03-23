FactoryGirl.define do
  factory :member do
    name "Johnny Bravo"
    image Rack::Test::UploadedFile.new(Rails.root + 'spec/files/images/johnny_bravo.jpg', 'image/jpg')
    company_name "Bravo Inc."
    company_webopage "www.bravo.co"
  end
end
