class AddColsClase < ActiveRecord::Migration
  def change
    add_column :clases, :lat, :float
    add_column :clases, :long, :float
    add_column :clases, :contacto, :text
  end
end
