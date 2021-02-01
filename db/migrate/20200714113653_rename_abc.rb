class RenameAbc < ActiveRecord::Migration[6.0]
  def change
    rename_column :vendors, :describtion, :description
  end
end
