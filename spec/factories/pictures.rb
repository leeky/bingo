include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :picture do
    name "Image Name"
    image { fixture_file_upload(Rails.root.join('spec', 'assets', 'pictures', 'image.jpg'), "image/jpeg") }
  end
end