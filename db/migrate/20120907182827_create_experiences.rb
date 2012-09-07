class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.references :resume
      t.string :title
      t.string :company
      t.string :place
      t.date :from_date
      t.date :until_date
      t.text :description

      t.timestamps
    end
    add_index :experiences, :resume_id
  end
end
