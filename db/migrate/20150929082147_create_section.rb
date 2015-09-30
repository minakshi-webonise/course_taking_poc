class CreateSection < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :section_name
    end
  end
end
