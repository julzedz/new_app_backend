class AddFullnameAndAddressToUsers < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      ALTER TABLE users
      ADD COLUMN fullname text GENERATED ALWAYS AS (first_name || ' ' || last_name) STORED;
    SQL

    execute <<-SQL
      ALTER TABLE users
      ADD COLUMN address text GENERATED ALWAYS AS (city || ', ' || state || ', ' || country) STORED;
    SQL
  end
end
