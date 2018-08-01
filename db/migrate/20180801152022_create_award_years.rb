class CreateAwardYears < ActiveRecord::Migration[5.1]
  def change
    create_table :award_years do |t|
      t.integer :year
      t.references :song, foreign_key: true
      t.references :award, foreign_key: true
    end
  end
end
