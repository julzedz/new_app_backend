class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.integer :user_id
      t.text :email
      t.text :password
      t.date :dob
      t.text :first_name
      t.text :last_name
      t.text :phone_number
      t.text :city
      t.text :state
      t.text :country
      t.string :profile_image_path

      t.timestamps
      
    end
  end
end
