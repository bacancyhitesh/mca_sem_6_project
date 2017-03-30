#this seed file is made by pratik for geting the sample inital data ready
namespace :db do

  desc "Insert data for the Sample Users"



   task populate: :environment do

     [User, City, Education, IndustryType, Location, Role, Skill, JobType].each(&:delete_all)


      City.populate 50 do |city|
        city.name = Faker::Address.city
      end
      puts "City Record is Inserted..."

      Education.populate 50 do |education|
      education.qualification = Faker::Educator.course
      end

      IndustryType.populate 50 do |industry|
        industry.name = Faker::Commerce.department
      end
      puts "IndustryType Record is Inserted..."


      Location.populate 50 do |city|
        city.name = Faker::Address.city
      end
      puts "Location Record is Inserted..."

      Role.populate 50 do |role|
        role.name= Faker::Company.profession
      end
      puts "Roles Record is Inserted..."


      skill_list = ["JavaScript","PHP","ASP.NET","RUBY ON RAILS","RUBY","HTML","CSS","Bootstrap","Angular-JS","Android","Larawel","IOS"]

      skill_list.each do |skill|
          Skill.create!(name: skill)
      end
      puts "skills Record is Inserted..."


      job_types_list = ["PartTime","Fulltime","Correspondence"]
      job_types_list.each do |jobtype|
          JobType.create!(name: jobtype)
      end
      puts "Job Types Record is Inserted..."


      User.create!(
      name: "pratik",
      email: "pratik@email.com",
      password: "123456",
      contactnumber: "9237664447"
      )

      puts "sample user is crated \n Username : pratik@email.com \n password : 123456"


      Employer.create!(
      first_name: "Ketan",
      last_name: "Mangukiya",
      contact: "8140000515",
      company_name: "BacancyTechnology",
      role_id: 23,
      email: "ketan@gmail.com",
      password: "123456"
      )


      puts
      puts "samle Employer is crated \n Username : ketan@gmail.com \n password : 123456"


      Company.populate 10 do |company|
        company.employer_id= Faker::Number.between(1,1)
        company.name = Faker::Name.last_name
        company.website = "www"+Faker::Internet.domain_name
        company.industry_type_id = Faker::Number.between(1, 50)
        company.description = Faker::Lorem.sentence
        company.address = Faker::Address.street_address
        company.city_id = Faker::Number.between(1,50)
        company.contact = Faker::Company.australian_business_number
        company.email = Faker::Internet.free_email
        company.google_plus = Faker::Internet.url
        company.facebook = Faker::Internet.url
        company.linkedin = Faker::Internet.url

        ContactPerson.populate 10 do |contactperson|
          contactperson.company_id = company.id
          contactperson.first_name = Faker::Name.first_name
          contactperson.last_name = Faker::Name.last_name
          contactperson.contact = Faker::Company.australian_business_number
          contactperson.email = Faker::Internet.free_email
          contactperson.role_id = Faker::Number.between(1, 50)
        end

        Job.populate 5 do |job|
          skills=(1..12).to_a.sample 5
          job.company_id = company.id
          job.job_type_id = Faker::Number.between(1,3)
          job.role_id = Faker::Number.between(1,50)
          job.contact_person_id = Faker::Number.between(1,10)
          job.vacancy = Faker::Number.between(1,200)
          job.description = Faker::Lorem.paragraph
          job.salary = Faker::Number.number(4)
          job.address = Faker::Address.street_address
          job.experience = Faker::Number.between(1,30)
          job.start_date= Faker::Date.backward(14)
          job.end_date = Faker::Date.forward(23)
          job.status = "Active"
       end


    end
  end
end
