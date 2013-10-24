class CreateAisApplicationComments < ActiveRecord::Migration
  def change
    create_table :ais_application_comments do |t|
      t.string :banner_pidm
      t.string :application_term
      t.integer :application_number
      t.string :originator
      t.text :comment

      t.timestamps
    end
  end
end
