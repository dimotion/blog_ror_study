class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :login, null: false
    	t.string :last_name
    	t.string :first_name
    end
  end
end
