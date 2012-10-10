include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :font do
    name "Font Name"
    typeface { fixture_file_upload(Rails.root.join('spec', 'fonts', 'font.ttf'), "application/x-font-ttf") }
  end
end