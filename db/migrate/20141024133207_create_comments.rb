class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.references :post
    	t.string :title
    	t.string :message, default: "", null: false
    	t.timestamps
    end
  end
end
