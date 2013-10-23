class CreateGsnakes < ActiveRecord::Migration
  def up
    create_table :gsnakes do |t|
      t.string :name
      t.timestamps
    end
  end

  def down
    drop_table :gsnakes
  end
end
