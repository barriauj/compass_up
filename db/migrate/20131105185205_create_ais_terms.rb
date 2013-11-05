class CreateAisTerms < ActiveRecord::Migration
  def change
    create_table :ais_terms do |t|
      t.date :effective_on
      t.string :spring
      t.string :summer
      t.string :fall

      t.timestamps
    end
  end
end
