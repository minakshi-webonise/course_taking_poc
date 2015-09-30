class AddCourseIdToSectionTable < ActiveRecord::Migration
  def change
    add_column :sections, :course_id, :interger
  end
end
