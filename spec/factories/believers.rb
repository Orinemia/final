# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do 
	factory :believer do
        firstname                "Orinemia"
        lastname                 "Ajulo"
        email                    "orinemia@awesome.com"
        password                 "scatterarea"
        password_confirmation    "scatterarea"
   end
end
