class CreateUserWikisTable < ActiveRecord::Migration
  def change
    create_table :users_wikis do |t|
       t.references :user
        t.references :wiki
    end

    remove_column :wikis, :user_id
  end
end
