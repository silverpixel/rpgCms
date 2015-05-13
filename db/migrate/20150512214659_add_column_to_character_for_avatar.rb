class AddColumnToCharacterForAvatar < ActiveRecord::Migration
  def change
  	add_column :char_types, :avatar, :string
  end
end
