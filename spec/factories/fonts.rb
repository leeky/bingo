include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :font do
    name "Font Name"
    typeface { fixture_file_upload("files/font.ttf", "application/x-font-ttf") }
  end
end