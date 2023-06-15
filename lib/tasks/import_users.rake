require 'csv'

namespace :import do
  desc 'Import census users from CSV file'
  task users: :environment do
    file_path = 'db/census.csv'  # Replace with the actual path to your CSV file

    CSV.foreach(file_path, headers: true) do |row|
      user = User.create!(
        username: row['username'],
        email: row['email']== 'nil' ? nil : row['email'],
        password: row['password'],
        password_confirmation: row['password'],
        confirmed_at: Time.current,
        verified_at: Time.current,
        residence_verified_at: Time.current,
        terms_of_service: '1'
      )

      puts "Created user: #{user.username}"
    end
  end
end
