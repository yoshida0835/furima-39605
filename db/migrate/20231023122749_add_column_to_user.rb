class AddColumnToUser < ActiveRecord::Migration[7.0]
  def change

    add_column :users, :nickname, :string, null: false, default: ''
    add_column :users, :family_name, :string, null: false
    add_column :users, :first_name, :string, null: false
    add_column :users, :family_name_kana, :string, null: false
    add_column :users, :first_name_kana, :string, null: false
    add_column :users, :birthday, :string, null: false

  end
end
