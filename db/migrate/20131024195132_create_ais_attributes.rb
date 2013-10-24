class CreateAisAttributes < ActiveRecord::Migration
  def change
    create_table :ais_attributes do |t|
      t.string :banner_pidm
      t.string :application_term
      t.string :application_number
      t.string :name

      t.timestamps
    end
  end
end
