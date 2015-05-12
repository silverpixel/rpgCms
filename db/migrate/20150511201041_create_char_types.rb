class CreateCharTypes < ActiveRecord::Migration
  def change
    create_table :char_types do |t|
      t.integer "user_id"
      t.string "name", :limit => 20
      # Carrierwave gem - obavezni edit
      #t.blob "avatar"
      t.timestamps
    end
    add_index("char_types", "user_id")
  end
end
