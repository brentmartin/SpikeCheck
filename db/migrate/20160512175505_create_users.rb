class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :location
      t.string :email
      t.string :password_digest
      t.string :user_photo
      t.boolean :registration

      t.timestamps null: false
    end
  end
end
