class AddCourseIdToSection < ActiveRecord::Migration
  def change
    add_column :sections, :couse_id, :interger
  end
end
