class RenameTypeOnFlats < ActiveRecord::Migration[6.0]
  def change
    rename_column :flats, :type, :flat_type
  end
end
