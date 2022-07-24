class CreateSessionInstances < ActiveRecord::Migration[7.0]
  def change
    create_table :session_instances do |t|
      t.belongs_to :session, null: false, foreign_key: true
      t.references :sessionable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
