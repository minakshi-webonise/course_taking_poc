class CreateTableSection < ActiveRecord::Migration
  def change
    create_table :table_sections do |t|
      t.string :section_name
      t.belongs_to :course, index:true
    end
  end
end
