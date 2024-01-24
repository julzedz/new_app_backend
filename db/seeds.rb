# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

users_data = [
  { first_name: 'John', last_name: 'Doe', fullname: 'John Doe', email: 'john@hotmail.com', password: 'password1', phone_number: '1234567890', city: 'New York', state: 'NY', country: 'USA', address: 'New York, NY, USA', profile_image_path: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pexels.com%2Fsearch%2Fprofile%2520picture%2F&psig=AOvVaw0Z4Z4Z4Z4Z4Z4Z4Z4Z4Z4Z4Z4Z4Z4Z4Z4Z4Z4Z4Z4Z4Z4Z4&ust=1629788440008000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCJjQ4ZqH9_ICFQAAAAAdAAAAABAD' },
  { first_name: 'Jane', last_name: 'Smith', fullname: 'Jane Smith', email: 'jane@hotmail.com', password: 'password2', phone_number: '9876543210', city: 'Los Angeles', state: 'CA', country: 'USA', address: 'Los Angeles, CA, USA', profile_image_path: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pexels.com%2Fsearch%2Fprofile%2520picture%2F&psig=AOvVaw0Z4Z4Z4Z4Z4Z4Z4Z4Z4Z4Z4Z4Z4Z4Z4Z4Z4Z4Z4Z4Z4Z4Z4&ust=1629788440008000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCJjQ4ZqH9_ICFQAAAAAdAAAAABAD' },
  { first_name: 'Carl', last_name: 'Johnson', fullname: 'Carl Johnson', email: 'carl@hotmail.com', password: 'password3', phone_number: '5551112222', city: 'Chicago', state: 'IL', country: 'USA', address: 'Chicago, IL, USA', profile_image_path: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pexels.com%2Fsearch%2Fprofile%2520picture%2F&psig=AOvVaw0Z4Z4Z4Z4Z4Z4Z4Z4Z4Z4Z4Z4Z4Z4Z4Z4Z4Z4Z4Z4Z4Z4Z4&ust=1629788440008000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCJjQ4ZqH9_ICFQAAAAAdAAAAABAD' },
  { first_name: 'Alice', last_name: 'Williams', fullname: 'Alice Williams', email: 'alice@hotmail.com', password: 'password4', phone_number: '3334445555', city: 'Houston', state: 'TX', country: 'USA', address: 'Houston, TX, USA', profile_image_path: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pexels.com%2Fsearch%2Fprofile%2520picture%2F&psig=AOvVaw0Z4Z4Z4Z4Z4Z4Z4Z4Z4Z4Z4Z4Z4Z4Z4Z4Z4Z4Z4Z4Z4Z4Z4&ust=1629788440008000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCJjQ4ZqH9_ICFQAAAAAdAAAAABAD' },
]

users_data.each do |user_data|
  user = User.create(user_data)
  
  # Check if the user was created successfully
  if user.valid?
    account_data = { savings_account: 0, investment_account: 0, earnings: 0, stakes: 0 } # Set initial values
    account = Account.create(account_data)
    
    # Check if the account was created successfully
    if account.valid?
      UserAccountLink.create(user_id: user.id, account_id: account.id)
    else
      puts "Error creating account for user #{user.fullname}: #{account.errors.full_messages.join(', ')}"
    end
  else
    puts "Error creating user: #{user.errors.full_messages.join(', ')}"
  end
end

accounts_data = [
  { savings_account: 10000.50, investment_account: 5000.75, earnings: 1200.30, stakes: 0.5 },
  { savings_account: 7500.25, investment_account: 3000.50, earnings: 800.10, stakes: 0.2 },
  { savings_account: 20000.75, investment_account: 10000.00, earnings: 2500.50, stakes: 0.8 },
  { savings_account: 12000.00, investment_account: 6000.25, earnings: 1500.75, stakes: 0.3 },
]

# Link users and accounts
users_data.each_with_index do |user_data, index|
  user = User.find_by(user_data)
  account_data = accounts_data[index]
  account = Account.create(account_data)
  UserAccountLink.create(user_id: user.id, account_id: account.id)
end