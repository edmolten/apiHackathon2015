class CreateTemas < ActiveRecord::Migration
  def change
    create_table :temas do |t|
      t.string :name
    end
  end
end
