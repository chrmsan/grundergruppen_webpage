class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.string :name
      t.string :company_name
      t.string :company_webpage

      t.timestamps
    end
  end
end
