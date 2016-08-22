# lib/tasks/populate.rake
#
# Rake task to populate development database with test data
# Run it with "rake db:populate"

namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'faker'
    Rake::Task['db:reset'].invoke

    100.times do |c|
      @fn = Faker::Name.first_name
      @ln = Faker::Name.last_name
      @domain = Faker::Internet.domain_name
      @address = Faker::Address.street_address + ', ' + Faker::Address.city + ', ' + Faker::Address.postcode
      @password = Faker::Internet.password(10, 20, true, true)

      loop do
        @fn.index(/\W/) ? @fn = Faker::Name.first_name : break
      end

      loop do
        @ln.index(/\W/) ? @ln = Faker::Name.last_name : break
      end

      @clinician = Clinician.create!(
        :first_name => @fn,
        :last_name => @ln,
        :email => "#{@fn}#{@ln}@#{@domain}",
        :phone => Faker::PhoneNumber.cell_phone,
        :address => @address,
        :password => @password,
        :password_confirmation => @password
      )
    end

    300.times do |c|
      @address = Faker::Address.street_address + ', ' + Faker::Address.city + ', ' + Faker::Address.postcode
      @fn = Faker::Name.first_name
      @ln = Faker::Name.last_name

      loop do
        @fn.index(/\W/) ? @fn = Faker::Name.first_name : break
      end

      loop do
        @ln.index(/\W/) ? @ln = Faker::Name.last_name : break
      end

      @fam_doc = FamDoc.create!(
        :first_name => @fn,
        :last_name => @ln,
        :address => @address,
        :phone => Faker::PhoneNumber.cell_phone,
      )
    end

    1000.times do |c|
      @fn = Faker::Name.first_name
      @ln = Faker::Name.last_name
      @address = Faker::Address.street_address + ', ' + Faker::Address.city + ', ' + Faker::Address.postcode
      [true,false].sample == true ? @sex = 'Male' : @sex = 'Female'
      [true, false].sample == true ? @handler = Faker::Name.name : @handler = 'Not Required'
      @password = Faker::Internet.password(10, 20, true, true)

      loop do
        @fn.index(/[^A-Za-z]/) ? @fn = Faker::Name.first_name : break
      end

      loop do
        @ln.index(/[^A-Za-z]/) ? @ln = Faker::Name.last_name : break
      end

      loop do
        @handler.index(/[^A-Za-z\s]/) ? @handler = Faker::Name.name : break
      end

      @patient = Patient.create!(
        :care_id => Faker::Number.number(10),
        :care_handler => @handler,
        :first_name => @fn,
        :last_name => @ln,
        :sex => @sex,
        :age => rand(30..90),
        :email => "#{@fn}#{@ln}@" + Faker::Internet.domain_name,
        :phone => Faker::PhoneNumber.cell_phone,
        :address => @address,
        :password => @password,
        :password_confirmation => @password,
        :clinician_id => rand(1..100),
        :fam_doc_id => rand(1..300)
      )
    end

    5000.times do |c|
      @diag = Faker::Hipster.words(5, true, true).join(' ')
      @record = PatientRec.create!(
        :visit_date => Faker::Date.between(1.year.ago, Date.today),
        :diagnoses => @diag,
        :diag_date => Faker::Date.between(1.year.ago, Date.today),
        :diag_description => "#{@diag}\n\n" + Faker::ChuckNorris.fact,
        :current_prescription => Faker::Hipster.words(rand(1..5)).join(', '),
        :new_prescription => Faker::Hipster.words(rand(1..2)).join(', '),
        :prescribed_date => Faker::Date.between_except(1.year.ago, Date.today, Date.today),
        :new_prescription_end => Faker::Date.between(3.month.ago, 6.month.from_now),
        :clinician_id => rand(1..100),
        :patient_id => rand(1..1000)
      )
    end

    10000.times do |c|
      [true, false].sample == true ? @eb = 'Yes' : @eb = 'No'
      [true, false].sample == true ? @ls = 'Yes' : @ls = 'No'
      [true, false].sample == true ? @lh = 'Yes' : @lh = 'No'
      [true, false].sample == true ? @nb = 'Yes' : @nb = 'No'
      @log= PatientLog.create!(
        :date => Faker::Date.between(1.year.ago, Date.today),
        :heartrate => rand(55..130),
        :bp_hi => rand(70..190),
        :bp_low => rand(40..100),
        :weight => rand(95..230),
        :exerting_breath => @eb,
        :night_breath => @nb,
        :leg_swollen => @ls,
        :lightheadedness => @lh,
        :patient_id => rand(1..1000)
      )
    end

  end
end
