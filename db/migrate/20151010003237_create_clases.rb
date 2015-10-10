class CreateClases < ActiveRecord::Migration
  def change
    create_table :clases do |t|
      t.string :title
      t.boolean :isADomicilio
      t.boolean :isDesignadoPorTutor
      t.integer :price
      t.integer :user_id
      t.integer :tema_id
      t.text :description
      t.text :disponibilidad
      t.string :nivel
      t.boolean :activa
    end
  end
end
