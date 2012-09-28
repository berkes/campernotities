class CreateCampings < ActiveRecord::Migration
  def change
    create_table :campings do |t|
      t.text :description

      t.timestamps
    end
  end
end
