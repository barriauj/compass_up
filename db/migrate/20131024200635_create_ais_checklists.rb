class CreateAisChecklists < ActiveRecord::Migration
  def change
    create_table :ais_checklists do |t|
      t.string :banner_pidm
      t.string :application_term
      t.integer :application_number
      t.string :requirement_code
      t.string :received_date
      t.string :item
      t.string :item_description
      t.string :ckst_code
      t.string :mandatory

      t.timestamps
    end
  end
end
