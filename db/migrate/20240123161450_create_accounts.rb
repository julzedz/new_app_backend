class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.decimal :savings_account
      t.decimal :investment_account
      t.decimal :earnings
      t.decimal :stakes

      t.timestamps
    end
  end
end
