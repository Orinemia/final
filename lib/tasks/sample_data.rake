namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = Believer.create!(firstname: "Bayode",
                         lastname:  "Ajulo",
                         username: "Oris",
                         email: "orinemia@gmail.com",
                         password: "intothesun21!",
                         password_confirmation: "intothesun21!",
                         admin: true)
                      end
end