class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.text :password_digest
      t.text :remember_digest
      t.float :valoracion
      t.text :about
    end
  end
end
