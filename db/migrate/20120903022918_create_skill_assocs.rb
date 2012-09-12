class CreateSkillAssocs < ActiveRecord::Migration
  def change
    create_table :skill_assocs do |t|
      t.integer :person_id
      t.integer :skill_id
      t.text :comments

      t.timestamps
    end
  end
end
