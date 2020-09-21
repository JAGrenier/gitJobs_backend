class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :company
      t.string :company_url
      t.string :title
      t.string :logo_url
      t.string :location
      t.integer :likes

      t.timestamps
    end
  end
end
