 namespace :db do
 	desc "Fill database with sample data"
 	task populate: :environment do
 		100.times do |n|
 			first_name = Faker::Name.first_name
 			last_name = Faker::Name.last_name
 			phone_number = Faker::PhoneNumber.phone_number
 			email = Faker::Internet.email
 			address = Faker::Address.city
 			company = Faker::Company.name

 			User.find_by_phone_number("01050662603").contacts.create!(
 				first_name: first_name, last_name: last_name,
 				phone_number: phone_number, email: email,
 				address: address, company: company)
 		end
 	end
 end