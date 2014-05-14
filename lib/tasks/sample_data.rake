namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(firstname: "Orinemia",
                         lastname:  "Ajulo",
                         username: "Oris",
                         email: "orinemia@hotmail.com",
                         password: "Medusa@616!",
                         password_confirmation: "Medusa@616!",
                         admin: true)
                      end
end