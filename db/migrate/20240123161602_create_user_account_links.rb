class CreateUserAccountLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :user_account_links do |t|
      t.references :user, null: false, foreign_key: true
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
